# Open Source Packaging Design

**Date:** 2025-02-28
**Status:** Approved
**Repo name:** claude-marketing-susceptibility-eval

## Overview

Package the "Black Jeans Test" experiments as an open source repository that allows others to:
1. Easily replicate the original results
2. Modify experiments to test new tactics or models

## Target Audience

General tech audience - accessible writeup with clear instructions, results summary upfront, technical details for those who want to dig in.

## Repo Structure

```
claude-marketing-susceptibility-eval/
├── README.md                    # Main documentation
├── LICENSE                      # MIT
├── requirements.txt             # anthropic, pandas
├── .gitignore                   # Python defaults, .env
├── .env.example                 # ANTHROPIC_API_KEY=your_key_here
│
├── experiment.py                # Run 1: Direct A/B testing
├── mcp_experiment.py            # Run 2: Agentic tool-use (moved from mcp_server/)
├── mcp_server.py                # MCP server for real testing (moved from mcp_server/)
│
├── results/                     # Original run data
│   ├── results_50runs.csv
│   ├── results_baseline.csv
│   └── mcp_results_baseline.csv
│
└── docs/
    ├── RESULTS.md               # Detailed Run 1 analysis
    └── RESULTS_MCP.md           # Detailed Run 2 analysis
```

## README Structure

1. One-line summary + key finding (93.8%)
2. Quick links to both blog posts
3. Quick start (5 steps)
4. Table of 16 manipulation tactics with results
5. Two experiments overview
6. How to modify/extend
7. Methodology & limitations
8. Links to detailed results
9. Citation info
10. License

## Code Changes

1. **experiment.py** - Update blog URL, clean up pip install docs, add model version note
2. **mcp_experiment.py** - Rename from mcp_server/experiment_mcp.py
3. **mcp_server.py** - Rename from mcp_server/server.py
4. **requirements.txt** - anthropic>=0.40.0, pandas>=2.0.0
5. **.env.example** - ANTHROPIC_API_KEY template
6. **.gitignore** - Python defaults, .env, user-generated CSVs
7. **LICENSE** - MIT

## Files to Remove

- linkedin_post.md
- blog_post.md

## Future Considerations

Live experiment versions will be added later to test real-world performance. Structure should remain extensible.

## License

MIT
