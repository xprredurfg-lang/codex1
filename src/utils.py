"""Utility helpers for plot generation."""

from __future__ import annotations

from pathlib import Path

from matplotlib.figure import Figure


def ensure_output_dir(outdir: str | Path) -> Path:
    """Ensure the output directory exists and return it as a Path."""
    output_path = Path(outdir)
    output_path.mkdir(parents=True, exist_ok=True)
    return output_path


def save_figure(fig: Figure, output_path: Path, dpi: int) -> Path:
    """Save a matplotlib figure and close it to release resources."""
    fig.savefig(output_path, dpi=dpi, bbox_inches="tight")
    fig.clf()
    return output_path
