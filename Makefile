include filelist
#include FILELIST

FILES=$(CAN) $(LIGHT) $(LIGHT_BEAM) $(BEACON) $(PILLAR) $(LANE)
#   $(SPAR) 



OUTFILES=$(FILES:%=OUT/%)

all: seamap.png

seamap.png: $(OUTFILES)
	spritezero seamap ./OUT/



OUT/%.svg: SRC/CAN/%.svg
	cat $< | svgo -i - -o -  > $@.tmp
	python fitrect.py 100 100  $@.tmp $@ 0.2
	rm $@.tmp
	cat $@ | svgo -i - -o -  > $@.tmp
	mv $@.tmp $@

OUT/%.svg: SRC/LIGHT/%.svg
	cat $< | svgo -i - -o -  > $@.tmp
	python fitrect.py 120 120  $@.tmp $@ 0.2
	rm $@.tmp
	cat $@ | svgo -i - -o -  > $@.tmp
	mv $@.tmp $@


OUT/%.svg: SRC/LIGHT_BEAM/%.svg
	cat $< | svgo -i - -o -  | python filter.py E 250 250 > $@.tmp
	python fitrect.py 250 250  $@.tmp $@ 0.15
	rm $@.tmp
	cat $@ | svgo -i - -o -  > $@.tmp
	mv $@.tmp $@


OUT/%.svg: SRC/BEACON/%.svg
	cat $< | svgo -i - -o -  > $@.tmp
	python fitrect.py 55 220  $@.tmp $@ 0.18
	rm $@.tmp
	cat $@ | svgo -i - -o -  > $@.tmp
	mv $@.tmp $@


OUT/%.svg: SRC/BEACON/TOP/%.svg
	cat $< | svgo -i - -o -  | python filter.py R 26 150 > $@.tmp
	python fitrect.py 55 300  $@.tmp $@ 0.18
	rm $@.tmp
	cat $@ | svgo -i - -o -  > $@.tmp
	mv $@.tmp $@


OUT/%.svg: SRC/PILLAR/%.svg
	cat $< | svgo -i - -o -  > $@.tmp
	python fitrect.py 100 220  $@.tmp $@ 0.15
	rm $@.tmp
	cat $@ | svgo -i - -o -  > $@.tmp
	mv $@.tmp $@


OUT/%.svg: SRC/LANE/%.svg
	cat $< | svgo -i - -o -  > $@.tmp
	python fitrect.py 80 250  $@.tmp $@ 0.15
	rm $@.tmp
	cat $@ | svgo -i - -o -  > $@.tmp
	mv $@.tmp $@


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
	#npm install -g @mapbox/spritezero-cli
	python -m pip install svgutils
	npm install -g svgo





