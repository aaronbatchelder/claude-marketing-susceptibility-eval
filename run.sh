#!/bin/bash
#
# Claude Marketing Susceptibility Eval - One-Command Runner
#
# Usage:
#   ./run.sh              # Run both experiments (quick test: 5 runs each)
#   ./run.sh direct       # Run only the direct A/B experiment
#   ./run.sh mcp          # Run only the MCP/tool-use experiment
#   ./run.sh full         # Run full experiments (50 runs direct, 10 runs MCP)
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo ""
echo "=============================================="
echo " Claude Marketing Susceptibility Eval"
echo "=============================================="
echo ""

# Check for API key
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo -e "${YELLOW}ANTHROPIC_API_KEY not set.${NC}"
    echo ""
    read -p "Enter your Anthropic API key: " api_key
    export ANTHROPIC_API_KEY="$api_key"
    echo ""
fi

# Check Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: python3 not found. Please install Python 3.8+${NC}"
    exit 1
fi

# Install dependencies if needed
if ! python3 -c "import anthropic" 2>/dev/null; then
    echo -e "${YELLOW}Installing dependencies...${NC}"
    pip install -r requirements.txt
    echo ""
fi

# Parse arguments
EXPERIMENT="${1:-both}"
RUNS_DIRECT=5
RUNS_MCP=5

if [ "$EXPERIMENT" = "full" ]; then
    RUNS_DIRECT=50
    RUNS_MCP=10
    EXPERIMENT="both"
fi

# Run experiments
case "$EXPERIMENT" in
    direct)
        echo -e "${GREEN}Running Direct A/B Experiment ($RUNS_DIRECT runs per variant)...${NC}"
        echo ""
        python3 experiment.py --runs "$RUNS_DIRECT" --output results_direct.csv
        ;;
    mcp)
        echo -e "${GREEN}Running MCP Tool-Use Experiment ($RUNS_MCP runs per variant)...${NC}"
        echo ""
        python3 mcp_experiment.py --runs "$RUNS_MCP" --output results_mcp.csv
        ;;
    both)
        echo -e "${GREEN}Running Both Experiments...${NC}"
        echo ""
        echo "--- Direct A/B Experiment ($RUNS_DIRECT runs per variant) ---"
        echo ""
        python3 experiment.py --runs "$RUNS_DIRECT" --output results_direct.csv
        echo ""
        echo "--- MCP Tool-Use Experiment ($RUNS_MCP runs per variant) ---"
        echo ""
        python3 mcp_experiment.py --runs "$RUNS_MCP" --output results_mcp.csv
        ;;
    *)
        echo "Usage: ./run.sh [direct|mcp|both|full]"
        echo ""
        echo "  direct  - Run direct A/B experiment only"
        echo "  mcp     - Run MCP tool-use experiment only"
        echo "  both    - Run both experiments (default, 5 runs each)"
        echo "  full    - Run full experiments (50 direct, 10 MCP)"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}Done! Results saved to results_*.csv${NC}"
