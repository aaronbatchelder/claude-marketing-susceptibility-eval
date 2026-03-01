# Open Source Packaging Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Package the Black Jeans Test as a clean, reproducible open source repo called `claude-marketing-susceptibility-eval`.

**Architecture:** Flatten the directory structure, add standard open source files (README, LICENSE, requirements.txt), move results and docs into organized folders, and prepare for GitHub push.

**Tech Stack:** Python, Anthropic SDK, Git

---

### Task 1: Create Directory Structure

**Files:**
- Create: `results/` directory
- Create: `docs/` directory

**Step 1: Create the new directories**

```bash
mkdir -p /Users/aaronbatchelder/blackjeans/results
mkdir -p /Users/aaronbatchelder/blackjeans/docs
```

**Step 2: Verify directories exist**

Run: `ls -la /Users/aaronbatchelder/blackjeans/`
Expected: See `results/` and `docs/` directories

---

### Task 2: Move Result CSV Files

**Files:**
- Move: `results_50runs.csv` → `results/results_50runs.csv`
- Move: `results_baseline.csv` → `results/results_baseline.csv`
- Move: `mcp_server/mcp_results_baseline.csv` → `results/mcp_results_baseline.csv`

**Step 1: Move the CSV files**

```bash
mv /Users/aaronbatchelder/blackjeans/results_50runs.csv /Users/aaronbatchelder/blackjeans/results/
mv /Users/aaronbatchelder/blackjeans/results_baseline.csv /Users/aaronbatchelder/blackjeans/results/
mv /Users/aaronbatchelder/blackjeans/mcp_server/mcp_results_baseline.csv /Users/aaronbatchelder/blackjeans/results/
```

**Step 2: Verify files moved**

Run: `ls -la /Users/aaronbatchelder/blackjeans/results/`
Expected: Three CSV files listed

---

### Task 3: Move Documentation Files

**Files:**
- Move: `RESULTS.md` → `docs/RESULTS.md`
- Move: `RESULTS_MCP.md` → `docs/RESULTS_MCP.md`

**Step 1: Move the markdown docs**

```bash
mv /Users/aaronbatchelder/blackjeans/RESULTS.md /Users/aaronbatchelder/blackjeans/docs/
mv /Users/aaronbatchelder/blackjeans/RESULTS_MCP.md /Users/aaronbatchelder/blackjeans/docs/
```

**Step 2: Verify files moved**

Run: `ls -la /Users/aaronbatchelder/blackjeans/docs/`
Expected: RESULTS.md and RESULTS_MCP.md listed

---

### Task 4: Flatten MCP Server Files

**Files:**
- Move: `mcp_server/experiment_mcp.py` → `mcp_experiment.py`
- Move: `mcp_server/server.py` → `mcp_server.py`
- Delete: `mcp_server/` directory

**Step 1: Move the Python files**

```bash
mv /Users/aaronbatchelder/blackjeans/mcp_server/experiment_mcp.py /Users/aaronbatchelder/blackjeans/mcp_experiment.py
mv /Users/aaronbatchelder/blackjeans/mcp_server/server.py /Users/aaronbatchelder/blackjeans/mcp_server.py
```

**Step 2: Remove the empty directory**

```bash
rmdir /Users/aaronbatchelder/blackjeans/mcp_server
```

**Step 3: Verify files in root**

Run: `ls /Users/aaronbatchelder/blackjeans/*.py`
Expected: experiment.py, mcp_experiment.py, mcp_server.py

---

### Task 5: Remove Unwanted Files

**Files:**
- Delete: `linkedin_post.md`
- Delete: `blog_post.md`

**Step 1: Remove the files**

```bash
rm /Users/aaronbatchelder/blackjeans/linkedin_post.md
rm /Users/aaronbatchelder/blackjeans/blog_post.md
```

**Step 2: Verify files removed**

Run: `ls /Users/aaronbatchelder/blackjeans/*.md`
Expected: No markdown files in root (docs/ has them now)

---

### Task 6: Create requirements.txt

**Files:**
- Create: `requirements.txt`

**Step 1: Create the file**

Write to `/Users/aaronbatchelder/blackjeans/requirements.txt`:

```
anthropic>=0.40.0
pandas>=2.0.0
```

**Step 2: Verify file contents**

Run: `cat /Users/aaronbatchelder/blackjeans/requirements.txt`
Expected: Two dependencies listed

---

### Task 7: Create .env.example

**Files:**
- Create: `.env.example`

**Step 1: Create the file**

Write to `/Users/aaronbatchelder/blackjeans/.env.example`:

```
ANTHROPIC_API_KEY=your_api_key_here
```

**Step 2: Verify file contents**

Run: `cat /Users/aaronbatchelder/blackjeans/.env.example`
Expected: API key placeholder

---

### Task 8: Create .gitignore

**Files:**
- Create: `.gitignore`

**Step 1: Create the file**

Write to `/Users/aaronbatchelder/blackjeans/.gitignore`:

```
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
*.egg-info/
dist/
build/
eggs/
*.egg

# Environment
.env
.venv/
venv/
ENV/

# IDE
.idea/
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# User-generated results (keep results/ for original data)
*.csv
!results/*.csv

# Misc
*.log
.cache/
```

**Step 2: Verify file contents**

Run: `cat /Users/aaronbatchelder/blackjeans/.gitignore`
Expected: Python ignores, .env, IDE files, OS files

---

### Task 9: Create LICENSE

**Files:**
- Create: `LICENSE`

**Step 1: Create the MIT license file**

Write to `/Users/aaronbatchelder/blackjeans/LICENSE`:

```
MIT License

Copyright (c) 2025 Aaron Batchelder

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

**Step 2: Verify file exists**

Run: `head -5 /Users/aaronbatchelder/blackjeans/LICENSE`
Expected: MIT License header

---

### Task 10: Update experiment.py

**Files:**
- Modify: `experiment.py` (lines 2-16)

**Step 1: Update the docstring**

Replace the docstring at the top of `experiment.py` with:

```python
"""
Claude Marketing Susceptibility Eval - Run 1: Direct A/B Testing

Tests whether LLM-based shopping agents are influenced by psychological
advertising tactics (anchoring, social proof, urgency, badges, etc.).

Related blog posts:
- Results: https://www.aaronbatchelder.com/blog/ai-agents-fall-for-ads
- Background: https://www.aaronbatchelder.com/blog/ad-buyer-of-the-future

Usage:
    pip install -r requirements.txt
    export ANTHROPIC_API_KEY=your_key_here
    python experiment.py --runs 50 --output results.csv

Model: Claude Sonnet 4 (claude-sonnet-4-20250514)
Note: Results may vary with different models or model versions.

Each experiment variant is run N times to get statistically meaningful results.
Results are logged to CSV for analysis.
"""
```

**Step 2: Verify the update**

Run: `head -20 /Users/aaronbatchelder/blackjeans/experiment.py`
Expected: New docstring with both blog links

---

### Task 11: Update mcp_experiment.py

**Files:**
- Modify: `mcp_experiment.py` (lines 1-12)

**Step 1: Update the docstring**

Replace the docstring at the top of `mcp_experiment.py` with:

```python
"""
Claude Marketing Susceptibility Eval - Run 2: Agentic Tool Use

Tests whether multi-step agentic behavior provides any defense against
advertising manipulation. The agent uses tools to search, browse, and
purchase products - simulating real AI shopping agent behavior.

Related blog posts:
- Results: https://www.aaronbatchelder.com/blog/ai-agents-fall-for-ads
- Background: https://www.aaronbatchelder.com/blog/ad-buyer-of-the-future

Usage:
    pip install -r requirements.txt
    export ANTHROPIC_API_KEY=your_key_here
    python mcp_experiment.py --runs 10 --output mcp_results.csv

Model: Claude Sonnet 4 (claude-sonnet-4-20250514)
Note: Results may vary with different models or model versions.
"""
```

**Step 2: Verify the update**

Run: `head -20 /Users/aaronbatchelder/blackjeans/mcp_experiment.py`
Expected: New docstring with model note

---

### Task 12: Create README.md

**Files:**
- Create: `README.md`

**Step 1: Create the comprehensive README**

Write to `/Users/aaronbatchelder/blackjeans/README.md`:

````markdown
# Claude Marketing Susceptibility Eval

**Testing whether AI agents fall for advertising tactics.**

## Key Finding

**93.8% of the time, the agent chose the manipulated option.**

When given two identical products with different framing (same price, same specs, same ratings), Claude followed the advertising signal in nearly every trial. This wasn't a subtle effect—it was near-deterministic.

## Blog Posts

- **[AI Agents Fall for Ads](https://www.aaronbatchelder.com/blog/ai-agents-fall-for-ads)** — Full results and analysis
- **[The Ad Buyer of the Future](https://www.aaronbatchelder.com/blog/ad-buyer-of-the-future)** — Original hypothesis

## Quick Start

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/claude-marketing-susceptibility-eval.git
cd claude-marketing-susceptibility-eval

# Install dependencies
pip install -r requirements.txt

# Set your API key
export ANTHROPIC_API_KEY=your_key_here

# Run a quick test (3 variants, 5 runs each = ~15 API calls)
python experiment.py --runs 5 --categories anchoring position

# Run the full experiment (16 variants, 50 runs each = 800 API calls)
python experiment.py --runs 50 --output my_results.csv
```

## What This Tests

| Tactic | Bias Exploited | Result |
|--------|---------------|--------|
| "Was $90, now $65" (anchoring) | Anchoring | 100% |
| High review count (2,847 vs 23) | Social proof | 100% |
| Emotional review language | Halo effect | 100% |
| "Best Seller" badge | Authority | 100% |
| "Editor's Choice" badge | Authority | 100% |
| Avoids "Sponsored" label | Ad distrust | 100% |
| "Sale ends in 2 hours!" | Urgency | 100% |
| Better return policy | Risk aversion | 100% |
| Faster shipping | Instant gratification | 100% |
| `recommended: true` in JSON | Authority | 100% |
| Higher `quality_score` in JSON | Authority | 100% |
| First position (identical products) | Primacy | 100% |
| **"Only 2 left in stock!"** | **Scarcity** | **0% (backfired!)** |

The scarcity tactic that works so well on humans completely backfires on AI. The agent interprets low stock as "unpopular" rather than "buy now."

## Two Experiments

### Run 1: Direct A/B Testing (`experiment.py`)

The agent sees two product options in a single prompt and chooses one. Tests 16 manipulation variants, 50 runs each.

```bash
python experiment.py --runs 50 --output results.csv
```

### Run 2: Agentic Tool Use (`mcp_experiment.py`)

The agent uses tools to search, browse details, and purchase. Tests whether multi-step reasoning provides any defense.

```bash
python mcp_experiment.py --runs 10 --output mcp_results.csv
```

**Result:** 90.0% susceptibility—only 3.8 percentage points lower than Run 1. Tool use provides no meaningful defense.

## Modifying the Experiments

### Add a new tactic

In `experiment.py`, add to the `VARIANTS` list:

```python
{
    "name": "your_tactic_name",
    "category": "your_category",
    "hypothesis": "What you expect to find",
    "prompt": (
        "Buy me a pair of black jeans. My budget is $50-$70.\n\n"
        "Option A: Product with manipulation\n"
        "Option B: Product without manipulation\n\n"
        "Both are identical otherwise. Which do you choose?"
    ),
    "expected_bias": "A",  # or "B"
},
```

### Test a different model

In `experiment.py`, change the `MODEL` constant:

```python
MODEL = "claude-3-5-sonnet-20241022"  # or any other model
```

### Test different system prompts

The experiment includes three system prompt variants:

```bash
# Test all system prompts
python experiment.py --all-prompts --runs 10

# Test specific prompts
python experiment.py --prompts neutral value_focused quality_focused
```

## Methodology

- **Model:** Claude Sonnet 4 (`claude-sonnet-4-20250514`)
- **Temperature:** 1.0 (to allow variance across runs)
- **Runs:** 50 per variant (Run 1), 10 per variant (Run 2)
- **Baseline expectation:** 50% = no influence (coin flip between identical products)

## Limitations

1. **Single model tested** — Other models (GPT-4, Gemini, open-source) may behave differently
2. **Simulated products** — Not tested against real e-commerce APIs
3. **Binary choices** — Real shopping involves more options
4. **No competing signals** — Didn't test what happens when both products have manipulation
5. **No price variation** — All products were $65

## Results Data

Original run data is available in `results/`:

- `results_50runs.csv` — Run 1 full results (800 trials)
- `results_baseline.csv` — Run 1 baseline (160 trials)
- `mcp_results_baseline.csv` — Run 2 results (140 trials)

Detailed analysis in `docs/`:

- [RESULTS.md](docs/RESULTS.md) — Run 1 detailed breakdown
- [RESULTS_MCP.md](docs/RESULTS_MCP.md) — Run 2 detailed breakdown

## Citation

If you use this in research:

```
@misc{batchelder2025susceptibility,
  author = {Batchelder, Aaron},
  title = {Claude Marketing Susceptibility Eval},
  year = {2025},
  url = {https://github.com/YOUR_USERNAME/claude-marketing-susceptibility-eval}
}
```

## License

MIT — see [LICENSE](LICENSE)
````

**Step 2: Verify README created**

Run: `head -30 /Users/aaronbatchelder/blackjeans/README.md`
Expected: Title and key finding section

---

### Task 13: Initialize Git Repository

**Step 1: Initialize git**

```bash
cd /Users/aaronbatchelder/blackjeans && git init
```

**Step 2: Add all files**

```bash
cd /Users/aaronbatchelder/blackjeans && git add .
```

**Step 3: Create initial commit**

```bash
cd /Users/aaronbatchelder/blackjeans && git commit -m "Initial commit: Claude Marketing Susceptibility Eval

93.8% of the time, AI agents chose the manipulated option.

- Run 1: Direct A/B testing of 16 manipulation tactics
- Run 2: Agentic tool-use testing
- Full results data included

Blog: https://www.aaronbatchelder.com/blog/ai-agents-fall-for-ads"
```

**Step 4: Verify commit**

Run: `cd /Users/aaronbatchelder/blackjeans && git log --oneline -1`
Expected: Initial commit message

---

### Task 14: Rename Directory

**Step 1: Rename the folder**

```bash
mv /Users/aaronbatchelder/blackjeans /Users/aaronbatchelder/claude-marketing-susceptibility-eval
```

**Step 2: Verify rename**

Run: `ls -la /Users/aaronbatchelder/claude-marketing-susceptibility-eval/`
Expected: All files present in renamed directory

---

### Task 15: Prepare for GitHub Push

**Step 1: Display push instructions**

Print instructions for the user to:
1. Create repo on GitHub (github.com/new)
2. Add remote: `git remote add origin git@github.com:USERNAME/claude-marketing-susceptibility-eval.git`
3. Push: `git push -u origin main`

---

## Execution Complete Checklist

After all tasks:
- [ ] Directory renamed to `claude-marketing-susceptibility-eval`
- [ ] README.md with key finding, quick start, full docs
- [ ] LICENSE (MIT)
- [ ] requirements.txt
- [ ] .env.example
- [ ] .gitignore
- [ ] Results in `results/` folder
- [ ] Docs in `docs/` folder
- [ ] MCP files flattened to root
- [ ] Unwanted files removed
- [ ] Git initialized with initial commit
- [ ] Ready to push to GitHub
