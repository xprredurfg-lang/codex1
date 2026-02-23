"""Generate example line and bar plots."""

from __future__ import annotations

import argparse
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np

from utils import ensure_output_dir, save_figure


def parse_args() -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(description="Generate example plots.")
    parser.add_argument("--outdir", default="outputs", help="Output directory path.")
    parser.add_argument("--dpi", type=int, default=150, help="DPI for saved images.")
    return parser.parse_args()


def create_line_plot(output_dir: Path, dpi: int) -> Path:
    """Create and save a line plot with sin and cos curves."""
    x_values = np.linspace(0, 2 * np.pi, 400)
    sin_values = np.sin(x_values)
    cos_values = np.cos(x_values)

    fig, ax = plt.subplots()
    ax.plot(x_values, sin_values, label="sin(x)")
    ax.plot(x_values, cos_values, label="cos(x)")
    ax.set_title("Sine and Cosine Curves")
    ax.set_xlabel("x")
    ax.set_ylabel("y")
    ax.legend()

    return save_figure(fig, output_dir / "plot.png", dpi)


def create_bar_plot(output_dir: Path, dpi: int) -> Path:
    """Create and save a bar chart with random values."""
    categories = [chr(code) for code in range(ord("A"), ord("J") + 1)]
    rng = np.random.default_rng(seed=42)
    values = rng.integers(0, 101, size=10)

    fig, ax = plt.subplots()
    ax.bar(categories, values)
    ax.set_title("Random Values by Category")
    ax.set_xlabel("Category")
    ax.set_ylabel("Value")

    return save_figure(fig, output_dir / "bar.png", dpi)


def main() -> None:
    """Application entrypoint."""
    args = parse_args()
    output_dir = ensure_output_dir(args.outdir)

    line_plot_path = create_line_plot(output_dir, args.dpi)
    bar_plot_path = create_bar_plot(output_dir, args.dpi)

    print(f"Generated line plot: {line_plot_path.resolve()}")
    print(f"Generated bar plot: {bar_plot_path.resolve()}")


if __name__ == "__main__":
    main()
