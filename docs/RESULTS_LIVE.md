# Live Product Experiment Results

**Testing marketing tactics on real products (Levi's, Wrangler, Carhartt, etc.)**

## Key Finding

**Social proof (review count) influences Claude 2-7x more than typical human rates.**

On real products with real brand names, most marketing tactics affect Claude at human-like rates (5-20% lift). But two tactics stand out as dramatically more effective on AI:

| Tactic | Lift above baseline | Human benchmark | Comparison |
|--------|---------------------|-----------------|------------|
| **Social Proof (review count)** | **+38%** | 5-20% | **2-7x human** |
| **Review Sentiment** | **+22%** | 5-20% | **1-4x human** |

## Full Results (n=40 per tactic)

| Tactic | Chose Manipulated | Lift | Effect |
|--------|-------------------|------|--------|
| Social Proof Volume | 88% | +38% | STRONG |
| Review Sentiment | 72% | +22% | MODERATE |
| Return Policy | 65% | +15% | MODERATE |
| Anchoring | 60% | +10% | MODERATE |
| Urgency (time) | 60% | +10% | MODERATE |
| Scarcity | 55% | +5% | WEAK |
| Shipping Speed | 55% | +5% | WEAK |
| Bestseller Badge | 52% | +2% | NONE |
| Editor's Choice | 52% | +2% | NONE |
| Sponsored Label | 50% | 0% | NONE |

**Overall: 61% chose manipulated option** (baseline = 50%)

## Comparison: Synthetic vs Live Products

| Tactic | Synthetic (fake brands) | Live (real brands) |
|--------|------------------------|-------------------|
| Social Proof Volume | 100% | 88% |
| Review Sentiment | 100% | 72% |
| Anchoring | 100% | 60% |
| Badges | 100% | 52% |
| Urgency | 100% | 60% |
| Scarcity | 0% (backfired) | 55% |
| Overall | 93.8% | 61% |

**Key insight:** The synthetic experiment overstated susceptibility because there was no other signal to differentiate the products. With real brand names and descriptions, Claude has more context to make decisions—but social proof still dominates.

## What This Means

1. **Review count is the most powerful signal** — A product with 15,000+ reviews at 4.6 stars beats a product with 23 reviews at 4.9 stars 88% of the time.

2. **Emotional review language works** — "INCREDIBLE! Life-changing!" beats "Decent. Good fit." 72% of the time.

3. **Badges don't work on real products** — Best Seller, Editor's Choice, and Sponsored labels have no measurable effect when there's real product context to evaluate.

4. **Scarcity doesn't backfire on real products** — Unlike the synthetic experiment where "Only 2 left!" backfired (0%), on real products it has a small positive effect (55%).

## Methodology

- **Model:** Claude Sonnet 4 (`claude-sonnet-4-20250514`)
- **Temperature:** 1.0
- **Products:** 8 real products (Levi's, Wrangler, Carhartt, Amazon Essentials, Lee, Goodfellow, GAP, UNIQLO)
- **Price normalization:** All products set to $65 to isolate manipulation variable
- **Position randomization:** Which product gets manipulated is randomized each trial
- **Trials:** 40 runs per tactic (400 total)

## Raw Data

Results saved to `results/live_results_40runs.csv`

## Reproduce

```bash
git clone https://github.com/aaronbatchelder/claude-marketing-susceptibility-eval.git
cd claude-marketing-susceptibility-eval
export ANTHROPIC_API_KEY=your_key
python live_experiment.py --runs 40 --output results/my_live_results.csv
```
