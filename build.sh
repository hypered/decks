#! /usr/bin/env bash

# Consider using this build.sh script to build everything, or the Makefile to
# build a single (updated) file at a time.

# Run this script within nix-shell, e.g with:
#   nix-shell shell.nix --run ./build.sh

mkdir -p docs

for i in sample git-craft git-basics git-advanced git-cards ; do
pandoc \
  -t html5 \
  -s \
  --template=default.revealjs \
  --standalone \
  --section-divs \
  --variable revealjs-url="/static/revealjs" \
  --variable controls=false \
  --variable transition=none \
  --variable center=false \
  --variable slideNumber=false \
  --variable history=true \
  -o docs/$i.html \
  $i.md
done

if [[ -d ../entrypoint ]] ; then
  rsync -aP ./docs/   ../entrypoint/as-is/decks/
  rsync -aP ./static/ ../entrypoint/as-is/static/
fi
