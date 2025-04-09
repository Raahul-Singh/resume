#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Compiling LaTeX resume..."

# Run xelatex twice to ensure all references are properly resolved
xelatex raahul_singh_resume.tex > /dev/null 2>&1
if [ $? -eq 0 ]; then
    xelatex raahul_singh_resume.tex > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Resume compiled successfully!${NC}"
        echo "Output saved as raahul_singh_resume.pdf"
        
        # Clean up auxiliary files
        echo "Cleaning up temporary files..."
        rm -f raahul_singh_resume.aux raahul_singh_resume.log raahul_singh_resume.out
        echo -e "${GREEN}✓ Cleanup complete${NC}"
    else
        echo -e "${RED}Error: Second compilation failed${NC}"
        exit 1
    fi
else
    echo -e "${RED}Error: First compilation failed${NC}"
    echo "Check raahul_singh_resume.log for details"
    exit 1
fi 