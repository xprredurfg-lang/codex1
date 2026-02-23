# Minimal Python Plot Project

This project generates two charts using `matplotlib` and saves them to an output directory:

- Line plot (`plot.png`) for `sin(x)` and `cos(x)` from `0` to `2π`
- Bar plot (`bar.png`) with 10 categories (`A-J`) and random values (`0-100`)

## Project structure

```text
.
├── requirements.txt
├── src/
│   ├── main.py
│   └── utils.py
└── outputs/  # auto-created at runtime
```

## Setup and run

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python src/main.py
```

## Command-line options

- `--outdir <path>`: output directory path (default: `outputs`)
- `--dpi <int>`: image DPI (default: `150`)

Example:

```bash
python src/main.py --outdir outputs --dpi 200
```

## Outputs

After running, you should see:

- `outputs/plot.png`
- `outputs/bar.png`

The script also prints the absolute paths of generated files in the terminal.
