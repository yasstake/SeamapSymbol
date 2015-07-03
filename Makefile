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

clean:
	- rm -rf OUT/*.svg


