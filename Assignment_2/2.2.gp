reset
set term pdfcairo color enhanced dashed linewidth 1.5 font "Times-Roman,16"

set style line 99 lt 0 lw 1.5 pt 0 ps 1.0
set style line 1 lt 1 lw 1.5 pt 1 ps 1.0
set style line 2 lt 2 lw 1.5 pt 2 ps 1.0
set style line 3 lt 3 lw 1.5 pt 3 ps 1.0
set style line 4 lt 4 lw 1.5 pt 4 ps 1.0
set style line 5 lt 5 lw 1.5 pt 5 ps 1.0
set style line 6 lt 6 lw 1.5 pt 6 ps 1.0
set style line 7 lt 7 lw 1.5 pt 7 ps 1.0
set style line 8 lt 8 lw 1.5 pt 8 ps 1.0
set style line 16 lt 16 lw 1.5 pt 16 ps 1.0

set style function lines

outfile = "2.2.pdf"
set out outfile
unset title
set key spacing 1.5 samplen 3
set key at graph 0.95, graph 0.95
set xlabel "s = ln({/Symbol r}/{/Symbol r}_{0})"
set ylabel "P_M(s)"
set tics scale 1.3
set mxtics 10
set mytics 10

# Axes
set xrange [-10:10]
set logscale y
set yrange [1e-6:100]

f50 = "EXTREME_hdf5_plt_cnt_0050_dens.pdf_ln_data"

# Gaussian fit
x0    = 1.0
sigma = 1.0
f(x) = 1/(sqrt(2.0*pi)*sigma) * exp(-(x-x0)**2/(2.0*sigma**2))
fit f(x) f50 u 1:(exp($1)*$3) via x0, sigma

# Print fitted parameters to the shell
print sprintf("Fit results:")
print sprintf("mean (x0)= %.3f", x0)
print sprintf("sigma    = %.3f", sigma)

# Plot
p f50 u 1:(exp($1)*$3) ls 1 t "Mass-weighted PDF", \
f(x) with lines ls 3 t sprintf("Fit: x0=%.3f, sigma=%.3f", x0, sigma)

# Write out a pdf file with the plot
print outfile." created."