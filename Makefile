include filelist


OUTFILES=$(FILES:%=OUT/%)
OUTFILES2=$(FILES:%=OUT2/%)


all: $(OUTFILES)

all2: $(OUTFILES2)

OUT/%.svg : E60_60/%.svg
	cat $< | svgo -i - -o -  | python filter.py E 60 60 > $@

OUT/%.svg : E80_80/%.svg
	cat $< | svgo -i - -o - | python filter.py E 80 80  > $@

OUT/%.svg : E125_125/%.svg
	cat $< | svgo -i - -o - | python filter.py E 125 125 > $@

OUT/%.svg : R25_100/%.svg
	cat $< | svgo -i - -o - | python filter.py R 25 100  > $@

OUT/%.svg : R25_190/%.svg
	cat $< |  svgo -i - -o - | python filter.py R 25 190  > $@

OUT/%.svg : R50_150/%.svg
	cat $< |  svgo -i - -o - | python filter.py R 50 150  > $@

OUT/%.svg : R50_190/%.svg
	cat $< |  svgo -i - -o - | python filter.py R 50 190  > $@

OUT/%.svg : R75_190/%.svg
	cat $< |  svgo -i - -o - | python filter.py R 75 190  > $@

OUT/%.svg : org/%.svg
	cat $< | svgo -i - -o - > $@

prepare:
	- mkdir OUT
	- mkdir OUT2

clean:
	- rm -rf OUT/*.svg
	- rm -rf OUT2/*.svg

#---
OUT2/%.svg : E60_60/%.svg
	cat $< > $@

OUT2/%.svg : E80_80/%.svg
	cat $< > $@

OUT2/%.svg : E125_125/%.svg
	cat $< > $@

OUT2/%.svg : R25_100/%.svg
	cat $< > $@

OUT2/%.svg : R25_190/%.svg
	cat $< > $@

OUT2/%.svg : R50_150/%.svg
	cat $< > $@

OUT2/%.svg : R50_190/%.svg
	cat $< > $@

OUT2/%.svg : R75_190/%.svg
	cat $< > $@

OUT2/%.svg : org/%.svg
	cat $< > $@

splite:
	spritezero seamap OUT2

download-font:
	wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip
	unzip NotoSansCJKjp-hinted.zip

font-glyph:
	build-glyphs 'NotoSansCJKjp-Regular.otf' noto