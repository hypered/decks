# Consider using the build.sh script to build everything, or this Makefile to
# build a single (updated) file at a time.

all: \
  ../entrypoint/as-is/decks/sample.html \
  ../entrypoint/as-is/decks/git-advanced.html \
  ../entrypoint/as-is/decks/git-basics.html \
  ../entrypoint/as-is/decks/git-cards.html \
  ../entrypoint/as-is/decks/git-craft.html

../entrypoint/as-is/decks/%.html: %.md ../design-system/slides/default.revealjs
	pandoc \
	  -t html5 \
	  -s \
	  --template=../design-system/slides/default.revealjs \
	  --standalone \
	  --section-divs \
	  --variable revealjs-url="/static/revealjs" \
	  --variable controls=false \
	  --variable transition=none \
	  --variable center=false \
	  --variable slideNumber=false \
	  --variable history=true \
	  -o docs/$*.html \
	  $*.md
	cp docs/$*.html ../entrypoint/as-is/decks/
