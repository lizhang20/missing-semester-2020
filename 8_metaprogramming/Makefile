small_size.png: plot-data.png
	convert plot-data.png -resize 50% $@

plot-%.png: %.dat plot.py
	./plot.py -i $*.dat -o $@

.PHONY: clean
clean:
	rm *.png 
