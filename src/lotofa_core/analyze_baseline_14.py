"""
Isolamento e análise dos 8 concursos onde o baseline aleatório atingiu 14 acertos.
Reproduz a geração com a mesma seed usada no backtest baseline.
"""
from __future__ import annotations
import json
from pathlib import Path

from .loader import load_history
from .scoring import ScoringContext
from .generators import generate_random_baseline
from .features import compute_features
from .models import U

CONCURSOS_14 = [300, 443, 692, 716, 1455, 1886, 1920, 3019]
WINDOW = 250
N_SETS = 30
SEED_BASE = 20260517
HISTORY_PATH = Path(".claude/skills/lotofa/data/lotofacil_history_clean.csv")


def analyze():
    history = load_history(HISTORY_PATH)
    concurso_map = {d.concurso: d for d in history}

    # test_draws no backtest = history[WINDOW:] com step=1
    # índice i de um concurso c = (posição no histórico) - WINDOW
    history_idx = {d.concurso: i for i, d in enumerate(history)}

    results = []

    for target_concurso in CONCURSOS_14:
        target = concurso_map[target_concurso]
        target_idx = history_idx[target_concurso]
        i = target_idx - WINDOW          # índice no array de test_draws
        seed = SEED_BASE + i

        train = history[max(0, target_idx - WINDOW): target_idx]
        ctx = ScoringContext(train, WINDOW)

        candidates = generate_random_baseline(
            history=train,
            n_sets=N_SETS,
            window=WINDOW,
            seed=seed,
            ctx=ctx,
        )

        best_acertos = 0
        best_cand = None
        for cand in candidates:
            acertos = len(cand.H & target.H)
            if acertos > best_acertos:
                best_acertos = acertos
                best_cand = cand

        if best_acertos != 14:
            print(f"AVISO: concurso {target_concurso} retornou {best_acertos} acertos (esperado 14)")
            continue

        H_real = target.H
        H_cand = best_cand.H
        E_real = target.E
        E_cand = best_cand.E

        acertos_H    = H_cand & H_real
        erro_H       = H_cand - H_real
        ausente_real = H_real - H_cand
        e_intersect  = E_cand & E_real

        f_cand = compute_features(H_cand)
        f_real = compute_features(H_real)

        freq_counts = {n: 0 for n in U}
        for d in train:
            for n in d.H:
                freq_counts[n] += 1
        total_train = len(train)

        results.append({
            "concurso": target_concurso,
            "data": str(target.date),
            "H_real": sorted(H_real),
            "H_candidato": sorted(H_cand),
            "acertos": best_acertos,
            "dezenas_acertadas": sorted(acertos_H),
            "erro_no_candidato": sorted(erro_H),
            "faltou_no_candidato": sorted(ausente_real),
            "E_cand_intersect_E_real": sorted(e_intersect),
            "rank_no_ensemble": next(
                (j+1 for j, c in enumerate(candidates) if c.H == H_cand), -1
            ),
            "features_candidato": {
                "soma": f_cand.soma,
                "qtd_pares": f_cand.qtd_pares,
                "qtd_moldura": f_cand.qtd_moldura,
                "qtd_consecutivos": f_cand.qtd_consecutivos_adj,
            },
            "features_real": {
                "soma": f_real.soma,
                "qtd_pares": f_real.qtd_pares,
                "qtd_moldura": f_real.qtd_moldura,
                "qtd_consecutivos": f_real.qtd_consecutivos_adj,
            },
            "freq_erro_no_treino": round(freq_counts[sorted(erro_H)[0]] / total_train, 4),
            "freq_faltou_no_treino": round(freq_counts[sorted(ausente_real)[0]] / total_train, 4),
            "window_used": total_train,
        })

    return results


def print_report(results):
    sep = "-" * 72
    for r in results:
        print(sep)
        print(f"CONCURSO #{r['concurso']} | {r['data']} | 14 acertos [BASELINE]")
        print()
        print(f"  Sorteio real : {fmt(r['H_real'])}")
        print(f"  Candidato    : {fmt(r['H_candidato'])}")
        print()
        print(f"  Acertou (14) : {fmt(r['dezenas_acertadas'])}")
        print(f"  Erro cand.   : {fmt(r['erro_no_candidato'])}  <- estava no jogo, NAO saiu")
        print(f"  Faltou       : {fmt(r['faltou_no_candidato'])}  <- saiu, NAO estava no jogo")
        print()
        print(f"  |E_c inter E_t| = {len(r['E_cand_intersect_E_real'])}  -> {fmt(r['E_cand_intersect_E_real'])}")
        print()
        print(f"  Rank no ensemble: #{r['rank_no_ensemble']}/{N_SETS}")
        print()
        print(f"  Features candidato : soma={r['features_candidato']['soma']}  "
              f"pares={r['features_candidato']['qtd_pares']}  "
              f"moldura={r['features_candidato']['qtd_moldura']}  "
              f"consec={r['features_candidato']['qtd_consecutivos']}")
        print(f"  Features real      : soma={r['features_real']['soma']}  "
              f"pares={r['features_real']['qtd_pares']}  "
              f"moldura={r['features_real']['qtd_moldura']}  "
              f"consec={r['features_real']['qtd_consecutivos']}")
        print()
        dez_erro   = r['erro_no_candidato'][0]
        dez_faltou = r['faltou_no_candidato'][0]
        print(f"  Dezena errada ({dez_erro:02d}): freq no treino = {r['freq_erro_no_treino']:.1%}")
        print(f"  Dezena faltou ({dez_faltou:02d}): freq no treino = {r['freq_faltou_no_treino']:.1%}")
    print(sep)


def fmt(lst):
    return " ".join(f"{n:02d}" for n in lst)


N_SETS = 30

if __name__ == "__main__":
    results = analyze()
    print_report(results)

    out = Path("outputs/baseline-full/analise_baseline_14_acertos.json")
    out.write_text(json.dumps(results, indent=2, ensure_ascii=False), encoding="utf-8")
    print(f"\nJSON salvo em: {out}")
