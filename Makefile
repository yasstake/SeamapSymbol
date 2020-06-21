#include filelist
include FILELIST

FILES=$(CAN) $(LIGHT) $(LIGHT_BEAM) $(BEACON) $(PILLAR) $(LANE)
#   $(SPAR) 



OUTFILES=$(FILES:%=OUT/%)

all: seamap.png

seamap.png: $(OUTFILES)
	spritezero  seamap OUT


OUT/%.svg: SRC/CAN/%.svg
	python fitrect.py 100 100  $< $@ 0.2


OUT/%.svg: SRC/LIGHT/%.svg
	python fitrect.py 120 120  $< $@ 0.2


OUT/%.svg: SRC/LIGHT_BEAM/%.svg
	cat $< | svgo -i - -o -  | python filter.py E 250 250 > $@.tmp
	python fitrect.py 250 250  $@.tmp $@ 0.15
	rm $@.tmp


OUT/%.svg: SRC/BEACON/%.svg
	python fitrect.py 55 220  $< $@ 0.18

OUT/%.svg: SRC/BEACON/TOP/%.svg
	cat $< | svgo -i - -o -  | python filter.py R 26 150 > $@.tmp.svg
	python fitrect.py 55 300  $@.tmp.svg $@ 0.18
	rm $@.tmp.svg

OUT/%.svg: SRC/PILLAR/%.svg
	python fitrect.py 100 220  $< $@ 0.15

OUT/%.svg: SRC/LANE/%.svg
	python fitrect.py 80 250  $< $@ 0.15


prepare:
	- mkdir OUT

clean:
	- rm -rf OUT/*.svg
	- rm -f seamap.*

download-font:
	wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip
	unzip NotoSansCJKjp-hinted.zip

font-glyph:
	- mkdir noto
	build-glyphs 'NotoSansCJKjp-Regular.otf' noto


install-mac:
	brew install nodebrew
	nodebrew install-binary latest

install:
	npm install -g @mapbox/spritezero-cli
	python -m pip install svgutils
	npm install -g svgo
	#npm install @mapbox/spritezero




