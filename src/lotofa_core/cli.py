from __future__ import annotations
import argparse
import json
import sys
from pathlib import Path


def cmd_validate(args):
    from .loader import validate_only
    result = validate_only(args.history)
    print(json.dumps(result, indent=2, ensure_ascii=False))
    if result["status"] != "ok":
        sys.exit(1)


def cmd_stats(args):
    from .loader import load_history
    from .features import frequency_map, e_frequency_map

    history = load_history(args.history)
    window = args.window if hasattr(args, 'window') and args.window else len(history)
    window_draws = history[-window:]

    H_list = [d.H for d in window_draws]
    E_list = [d.E for d in window_draws]
    freq_H = frequency_map(H_list)
    freq_E = e_frequency_map(E_list)

    latest = history[-1]
    print(f"Total concursos carregados: {len(history)}")
    print(f"Intervalo: {history[0].concurso} – {history[-1].concurso}")
    print(f"Datas: {history[0].date} – {history[-1].date}")
    print(f"Último sorteio #{latest.concurso}: H={sorted(latest.H)} | E={sorted(latest.E)}")
    print(f"\nJanela usada para stats: {len(window_draws)} concursos")
    print("\nFrequência H por dezena (ordenado):")
    for n, f in sorted(freq_H.items(), key=lambda x: -x[1]):
        bar = "#" * int(f * 40)
        print(f"  {n:02d}: {f:.3f} {bar}")
    print("\nFrequência E (ausência) por dezena (ordenado):")
    for n, f in sorted(freq_E.items(), key=lambda x: -x[1]):
        bar = "#" * int(f * 40)
        print(f"  {n:02d}: {f:.3f} {bar}")


def cmd_generate(args):
    from .loader import load_history
    from .generators import generate_candidates
    from .audit import save_candidates_csv, save_candidates_jsonl, save_params, generate_audit_report

    history = load_history(args.history)
    output_dir = Path(args.output_dir) / args.version

    params = {
        "version": args.version,
        "seed": args.seed,
        "n_sets": args.n_sets,
        "window": args.window,
        "history_path": str(args.history),
        "concurso_min": history[0].concurso,
        "concurso_max": history[-1].concurso,
        "total_draws": len(history),
        "latest_concurso": history[-1].concurso,
        "latest_date": str(history[-1].date),
    }

    print(f"Gerando {args.n_sets} sets | versão {args.version} | seed {args.seed} | janela {args.window}...")
    candidates = generate_candidates(
        history=history,
        n_sets=args.n_sets,
        window=args.window,
        seed=args.seed,
    )

    csv_path = save_candidates_csv(candidates, output_dir)
    jsonl_path = save_candidates_jsonl(candidates, output_dir)
    params_path = save_params(params, output_dir)
    report_path = generate_audit_report(args.version, candidates, None, params, output_dir)

    print(f"Sets gerados: {len(candidates)}")
    print(f"CSV:    {csv_path}")
    print(f"JSONL:  {jsonl_path}")
    print(f"Params: {params_path}")
    print(f"Audit:  {report_path}")

    print("\nTop 5 sets por score:")
    for i, cand in enumerate(candidates[:5], 1):
        nums = " ".join(f"{n:02d}" for n in sorted(cand.H))
        print(f"  {i}. [{nums}] score={cand.score:.4f} soma={cand.features.soma} pares={cand.features.qtd_pares}")


def cmd_backtest(args):
    from .loader import load_history
    from .backtest import rolling_backtest
    from .audit import save_backtest_csv, generate_audit_report, save_params

    history = load_history(args.history)
    output_dir = Path(args.output_dir) / args.version

    params = {
        "version": args.version,
        "seed": args.seed,
        "n_sets": args.n_sets,
        "window": args.window,
        "test_last": args.test_last,
        "history_path": str(args.history),
        "concurso_min": history[0].concurso,
        "concurso_max": history[-1].concurso,
        "total_draws": len(history),
        "latest_concurso": history[-1].concurso,
        "latest_date": str(history[-1].date),
    }

    test_label = f"ultimos {args.test_last}" if args.test_last else "todos"
    print(f"Backtest rolling | versao {args.version} | janela {args.window} | testando {test_label} concursos | step {args.step}...")
    print("(pode levar alguns minutos)")

    result = rolling_backtest(
        history=history,
        window=args.window,
        n_sets=args.n_sets,
        seed=args.seed,
        version=args.version,
        step=args.step,
        test_last=args.test_last,
    )

    csv_path = save_backtest_csv(result, output_dir)
    params_path = save_params(params, output_dir)
    report_path = generate_audit_report(args.version, [], result, params, output_dir)

    print("\n" + "\n".join(result.summary_lines()))
    print(f"\nCSV:    {csv_path}")
    print(f"Params: {params_path}")
    print(f"Audit:  {report_path}")
    print("\nAVISO: Backtest mede performance historica -- nao e previsao do futuro.")


def cmd_peak(args):
    from .loader import load_history
    from .backtest import rolling_backtest_peak
    from .audit import save_backtest_csv, save_params

    history = load_history(args.history)
    output_dir = Path(args.output_dir) / args.version

    params = {
        "version": args.version,
        "type": "peak_hunter",
        "seed": args.seed,
        "n_sets": args.n_sets,
        "window": args.window,
        "test_last": args.test_last,
        "step": args.step,
        "history_path": str(args.history),
        "total_draws": len(history),
        "concurso_max": history[-1].concurso,
        "zona_soma": "175-215",
        "max_overlap": 11,
    }

    test_label = f"ultimos {args.test_last}" if args.test_last else "todos"
    print(f"Peak hunter | versao {args.version} | janela {args.window} | {test_label} concursos...")
    print("(zona tipica soma 175-215, overlap<=11, greedy maximin interno)")

    result = rolling_backtest_peak(
        history=history,
        window=args.window,
        n_sets=args.n_sets,
        seed=args.seed,
        version=args.version,
        step=args.step,
        test_last=args.test_last,
    )

    save_backtest_csv(result, output_dir)
    save_params(params, output_dir)
    print("\n" + "\n".join(result.summary_lines()))


def cmd_maxdiv(args):
    from .loader import load_history
    from .backtest import rolling_backtest_maxdiv
    from .audit import save_backtest_csv, save_params

    history = load_history(args.history)
    output_dir = Path(args.output_dir) / args.version

    params = {
        "version": args.version,
        "type": "maxdiv",
        "seed": args.seed,
        "n_sets": args.n_sets,
        "window": args.window,
        "test_last": args.test_last,
        "step": args.step,
        "history_path": str(args.history),
        "total_draws": len(history),
        "concurso_max": history[-1].concurso,
    }

    test_label = f"ultimos {args.test_last}" if args.test_last else "todos"
    print(f"MaxDiv | versao {args.version} | janela {args.window} | {test_label} concursos | step {args.step}...")
    print("(greedy maximin — sem scoring H/E, maxima diversidade de cobertura)")

    result = rolling_backtest_maxdiv(
        history=history,
        window=args.window,
        n_sets=args.n_sets,
        seed=args.seed,
        version=args.version,
        step=args.step,
        test_last=args.test_last,
    )

    save_backtest_csv(result, output_dir)
    save_params(params, output_dir)

    print("\n" + "\n".join(result.summary_lines()))


def cmd_baseline(args):
    from .loader import load_history
    from .backtest import rolling_backtest_baseline
    from .audit import save_backtest_csv, save_params

    history = load_history(args.history)
    output_dir = Path(args.output_dir) / args.version

    params = {
        "version": args.version,
        "type": "random_baseline",
        "seed": args.seed,
        "n_sets": args.n_sets,
        "window": args.window,
        "test_last": args.test_last,
        "step": args.step,
        "history_path": str(args.history),
        "concurso_min": history[0].concurso,
        "concurso_max": history[-1].concurso,
        "total_draws": len(history),
    }

    test_label = f"ultimos {args.test_last}" if args.test_last else "todos"
    print(f"Baseline aleatorio | versao {args.version} | janela {args.window} | {test_label} concursos | step {args.step}...")
    print("(filtros estruturais ativos, sem scoring H/E)")

    result = rolling_backtest_baseline(
        history=history,
        window=args.window,
        n_sets=args.n_sets,
        seed=args.seed,
        version=args.version,
        step=args.step,
        test_last=args.test_last,
    )

    csv_path = save_backtest_csv(result, output_dir)
    save_params(params, output_dir)

    print("\n" + "\n".join(result.summary_lines()))
    print(f"\nCSV: {csv_path}")


def main():
    parser = argparse.ArgumentParser(
        prog="python -m lotofa_core.cli",
        description="LOTOFA-CORE — motor estatístico Lotofácil",
    )
    sub = parser.add_subparsers(dest="command", required=True)

    # validate
    p_val = sub.add_parser("validate", help="Valida arquivo de histórico CSV")
    p_val.add_argument("--history", required=True, help="Caminho para lotofacil_history_clean.csv")
    p_val.set_defaults(func=cmd_validate)

    # stats
    p_stats = sub.add_parser("stats", help="Exibe estatísticas do histórico")
    p_stats.add_argument("--history", required=True)
    p_stats.add_argument("--window", type=int, default=0, help="Janela (0 = tudo)")
    p_stats.set_defaults(func=cmd_stats)

    # generate
    p_gen = sub.add_parser("generate", help="Gera sets candidatos")
    p_gen.add_argument("--history", required=True)
    p_gen.add_argument("--n-sets", type=int, default=30)
    p_gen.add_argument("--version", required=True, help="Ex: v8")
    p_gen.add_argument("--seed", type=int, default=20260517)
    p_gen.add_argument("--window", type=int, default=200)
    p_gen.add_argument("--output-dir", default="outputs")
    p_gen.set_defaults(func=cmd_generate)

    # backtest
    p_bt = sub.add_parser("backtest", help="Executa backtest rolling")
    p_bt.add_argument("--history", required=True)
    p_bt.add_argument("--version", required=True)
    p_bt.add_argument("--window", type=int, default=200)
    p_bt.add_argument("--n-sets", type=int, default=30)
    p_bt.add_argument("--seed", type=int, default=20260517)
    p_bt.add_argument("--test-last", type=int, default=0, help="Testar ultimos N concursos (0 = todos apos a janela)")
    p_bt.add_argument("--step", type=int, default=1, help="Testar a cada N concursos (1 = todos)")
    p_bt.add_argument("--output-dir", default="outputs")
    p_bt.set_defaults(func=cmd_backtest)

    # peak
    p_pk = sub.add_parser("peak", help="Backtest peak_hunter: zona tipica + diversidade interna forte")
    p_pk.add_argument("--history", required=True)
    p_pk.add_argument("--version", required=True)
    p_pk.add_argument("--window", type=int, default=250)
    p_pk.add_argument("--n-sets", type=int, default=30)
    p_pk.add_argument("--seed", type=int, default=20260517)
    p_pk.add_argument("--test-last", type=int, default=0)
    p_pk.add_argument("--step", type=int, default=1)
    p_pk.add_argument("--output-dir", default="outputs")
    p_pk.set_defaults(func=cmd_peak)

    # maxdiv
    p_md = sub.add_parser("maxdiv", help="Backtest com ensemble por cobertura maxima (greedy maximin)")
    p_md.add_argument("--history", required=True)
    p_md.add_argument("--version", required=True)
    p_md.add_argument("--window", type=int, default=250)
    p_md.add_argument("--n-sets", type=int, default=30)
    p_md.add_argument("--seed", type=int, default=20260517)
    p_md.add_argument("--test-last", type=int, default=0)
    p_md.add_argument("--step", type=int, default=1)
    p_md.add_argument("--output-dir", default="outputs")
    p_md.set_defaults(func=cmd_maxdiv)

    # baseline
    p_bl = sub.add_parser("baseline", help="Backtest com geracao aleatoria (sem scoring H/E)")
    p_bl.add_argument("--history", required=True)
    p_bl.add_argument("--version", required=True)
    p_bl.add_argument("--window", type=int, default=250)
    p_bl.add_argument("--n-sets", type=int, default=30)
    p_bl.add_argument("--seed", type=int, default=20260517)
    p_bl.add_argument("--test-last", type=int, default=0)
    p_bl.add_argument("--step", type=int, default=1)
    p_bl.add_argument("--output-dir", default="outputs")
    p_bl.set_defaults(func=cmd_baseline)

    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
