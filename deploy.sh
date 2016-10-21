#!/bin/bash

# Exit on error or variable unset
set -o errexit -o nounset

NC='\033[39m'
CYAN='\033[36m'
GREEN='\033[32m'

rev=$(git rev-parse --short HEAD)

#echo -e "${CYAN}Running cargo doc${NC}"
# Make a temp directory if not already existing
#mkdir -p doc

echo -e "${CYAN}Running mdbook build${NC}"
# Run mdbook to generate the book
/Users/pA/.cargo/bin/mdbook build .

#echo -e "${CYAN}Copying book to target/doc${NC}"
# Copy files from rendered book to doc root
#cp -R book-example/book/* target/doc/

cd book

echo -e "${CYAN}Initializing Git${NC}"
git init
#git config user.name "Patrick Horlebein"
#git config user.email "pad@play-esport.de"

#git remote add upstream "https://$GH_TOKEN@github.com/azerupi/mdBook.git"
git remote add upstream "https://github.com/PixelPirate/UnityEditorExtentionsBook.git"
git fetch upstream
git reset upstream/gh-pages

touch .

echo -e "${CYAN}Pushing changes to gh-pages${NC}"
git add -A .
git commit -m "Rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages

echo -e "${CYAN}Deleting temporary files${NC}"
rm -rf ../book

echo -e "${GREEN}Deployement done${NC}"
