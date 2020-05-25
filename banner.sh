make; 
bin/palette -n 256 > a.data; 
bin/julia -r 160x160 -s 3x3 -t -1.5+-1.5i -n 256 -b 256 -c -0.757730701301672+0.121160627920417i | bin/normalize -r 160x160 | bin/dtou16 -r 160x160 | bin/dither -r 160x160 >> a.data;
for i in {0..127}; 
do (echo "P6 160 160 255" > $(printf "%03d" $i).ppm; bin/graph -r 160x160 -n 256 -s $((i * 2)) < a.data >> $(printf "%03d" $i).ppm); 
done; 
montage *.ppm -tile 16x8 -geometry 80x80+0+0 banner.jpg; 
rm a.data *.ppm
