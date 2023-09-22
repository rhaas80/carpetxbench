set output "grid.pdf"
set term pdf
plot \
  "<gawk '$1+0==8 && $3+0==10' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=10", \
  "<gawk '$1+0==8 && $3+0==9' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=9", \
  "<gawk '$1+0==8 && $3+0==8' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=8", \
  "<gawk '$1+0==8 && $3+0==7' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=7", \
  "<gawk '$1+0==8 && $3+0==6' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=6", \
  "<gawk '$1+0==8 && $3+0==5' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=5", \
  "<gawk '$1+0==8 && $3+0==4' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=4", \
  "<gawk '$1+0==8 && $3+0==3' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=3", \
  "<gawk '$1+0==8 && $3+0==2' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=2", \
  "<gawk '$1+0==8 && $3+0==1' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=1", \
  "<gawk '$1+0==8 && $3+0==0' headon_merger_benchNoX/alp.x.asc" u 10:3 w p t "l=0"
