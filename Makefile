include filelist


OUTFILES=$(FILES:%=OUT/%)


all: $(OUTFILES)


OUT/%.svg : E60_60/%.svg
	cat $< | svgo -i - -o -  | python filter.py E 60 60 > $@

OUT/%.svg : E80_80/%.svg
	cat $< | svgo -i - -o - | python filter.py E 80 80  > $@

OUT/%.svg : E125_125/%.svg
	cat $< | svgo -i - -o - | python filter.py E 125 125 > $@

OUT/%.svg : R25_100/%.svg
	cat $< | python filter.py R 25 100 | svgo -i - -o - > $@

OUT/%.svg : R25_190/%.svg
	cat $< | python filter.py R 25 190 | svgo -i - -o - > $@

OUT/%.svg : R50_150/%.svg
	cat $< | python filter.py R 50 150 | svgo -i - -o - > $@

OUT/%.svg : R50_190/%.svg
	cat $< | python filter.py R 50 190 | svgo -i - -o - > $@

OUT/%.svg : R75_190/%.svg
	cat $< | python filter.py R 75 190 | svgo -i - -o - > $@

OUT/%.svg : org/%.svg
	cat $< | svgo -i - -o - > $@

prepare:
	- mkdir OUT

clean:
	- rm -rf OUT/*.svg


