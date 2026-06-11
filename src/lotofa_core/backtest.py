from __future__ import annotations
from dataclasses import dataclass, field
from typing import List, FrozenSet, Dict

from .models import Draw, U
from .scoring import ScoringContext
from .generators import generate_candidates, generate_random_baseline, generate_max_diversity, generate_peak_hunter


@dataclass
class DrawResult:
    concurso: int
    acertos: int
    best_set: FrozenSet[int]


@dataclass
class BacktestResult:
    version: str
    window: int
    n_sets: int
    seed: int
    total_draws_tested: int
    distribution: Dict[int, int]
    mean_best_acertos: float
    max_acertos: int
    draws: List[DrawResult] = field(default_factory=list)

    def summary_lines(self) -> List[str]:
        lines = [
            f"Versao: {self.version}",
            f"Janela: {self.window} | Sets: {self.n_sets} | Seed: {self.seed}",
            f"Concursos testados: {self.total_draws_tested}",
            f"Media acertos (melhor set): {self.mean_best_acertos:.3f}",
            f"Maximo acertos: {self.max_acertos}",
            "Distribuicao:",
        ]
        for k in sorted(self.distribution):
            pct = 100 * self.distribution[k] / self.total_draws_tested
            lines.append(f"  {k} acertos: {self.distribution[k]}x ({pct:.1f}%)")
        return lines


def _run_backtest(history, test_draws, window, n_sets, seed, version, verbose, generator_fn) -> BacktestResult:
    total = len(test_draws)
    distribution: Dict[int, int] = {i: 0 for i in range(11, 16)}
    draw_results: List[DrawResult] = []

    for i, target in enumerate(test_draws):
        target_idx = history.index(target)
        train = history[max(0, target_idx - window): target_idx]

        if len(train) < 50:
            continue

        ctx = ScoringContext(train, window)
        candidates = generator_fn(train, n_sets, window, seed + i, ctx)

        best_acertos = 0
        best_set: FrozenSet[int] = frozenset()
        for cand in candidates:
            acertos = len(cand.H & target.H)
            if acertos > best_acertos:
                best_acertos = acertos
                best_set = cand.H

        bucket = max(11, min(15, best_acertos))
        distribution[bucket] = distribution.get(bucket, 0) + 1
        draw_results.append(DrawResult(concurso=target.concurso, acertos=best_acertos, best_set=best_set))

        if verbose and (i + 1) % 100 == 0:
            pct = 100 * (i + 1) / total
            print(f"  [{i+1}/{total}] {pct:.1f}% | concurso {target.concurso}", flush=True)

    tested = len(draw_results)
    mean_best = sum(r.acertos for r in draw_results) / tested if tested else 0.0
    max_ac = max((r.acertos for r in draw_results), default=0)

    return BacktestResult(
        version=version,
        window=window,
        n_sets=n_sets,
        seed=seed,
        total_draws_tested=tested,
        distribution=distribution,
        mean_best_acertos=mean_best,
        max_acertos=max_ac,
        draws=draw_results,
    )


def _resolve_test_draws(history, window, step, test_last):
    if len(history) < window + 10:
        raise ValueError(f"Historico insuficiente: {len(history)} concursos")
    all_test = history[window:]
    if test_last and test_last < len(all_test):
        all_test = history[-test_last:]
    return all_test[::step]


def rolling_backtest(
    history: List[Draw],
    window: int = 250,
    n_sets: int = 30,
    seed: int = 20260517,
    version: str = "v1",
    step: int = 1,
    test_last: int = 0,
    verbose: bool = True,
) -> BacktestResult:
    """Backtest com scoring H/E (modelo principal)."""
    def gen(train, n, w, s, ctx):
        return generate_candidates(history=train, n_sets=n, window=w, seed=s, ctx=ctx)

    test_draws = _resolve_test_draws(history, window, step, test_last)
    return _run_backtest(history, test_draws, window, n_sets, seed, version, verbose, gen)


def rolling_backtest_baseline(
    history: List[Draw],
    window: int = 250,
    n_sets: int = 30,
    seed: int = 20260517,
    version: str = "baseline",
    step: int = 1,
    test_last: int = 0,
    verbose: bool = True,
) -> BacktestResult:
    """Backtest com geracao aleatoria filtrada (sem scoring H/E)."""
    def gen(train, n, w, s, ctx):
        return generate_random_baseline(history=train, n_sets=n, window=w, seed=s, ctx=ctx)

    test_draws = _resolve_test_draws(history, window, step, test_last)
    return _run_backtest(history, test_draws, window, n_sets, seed, version, verbose, gen)


def rolling_backtest_peak(
    history: List[Draw],
    window: int = 250,
    n_sets: int = 30,
    seed: int = 20260517,
    version: str = "peak",
    step: int = 1,
    test_last: int = 0,
    verbose: bool = True,
) -> BacktestResult:
    """Backtest peak_hunter: zona tipica + diversidade interna forte (overlap <= 11)."""
    def gen(train, n, w, s, ctx):
        return generate_peak_hunter(history=train, n_sets=n, window=w, seed=s, ctx=ctx)

    test_draws = _resolve_test_draws(history, window, step, test_last)
    return _run_backtest(history, test_draws, window, n_sets, seed, version, verbose, gen)


def rolling_backtest_maxdiv(
    history: List[Draw],
    window: int = 250,
    n_sets: int = 30,
    seed: int = 20260517,
    version: str = "maxdiv",
    step: int = 1,
    test_last: int = 0,
    verbose: bool = True,
) -> BacktestResult:
    """Backtest com ensemble por cobertura maxima (greedy maximin)."""
    def gen(train, n, w, s, ctx):
        return generate_max_diversity(history=train, n_sets=n, window=w, seed=s, ctx=ctx)

    test_draws = _resolve_test_draws(history, window, step, test_last)
    return _run_backtest(history, test_draws, window, n_sets, seed, version, verbose, gen)
