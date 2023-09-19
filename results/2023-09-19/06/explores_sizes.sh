set -x -e
for max_grid_size_x in 16 32 64 ; do
for max_grid_size_y in 16 32 64 ; do
for max_grid_size_z in 16 32 64 ; do
for max_tile_size_y in 2 4 8 16 32 ; do
for max_tile_size_z in 2 4 8 16 32 ; do
if [ $max_grid_size_x -ge $max_grid_size_y ] && [ $max_grid_size_y -ge $max_grid_size_z ] && 
   [ $max_grid_size_z -ge $max_tile_size_y ] && [ $max_tile_size_y -ge $max_tile_size_z ] ; then
   threads=8
   fn=headon_merger_benchX_grid${max_grid_size_x}x${max_grid_size_y}x${max_grid_size_z}_tile${max_tile_size_y}x${max_tile_size_z}.par

   gawk '
/max_grid_size_x/{$NF = '$max_grid_size_x'}
/max_grid_size_y/{$NF = '$max_grid_size_y'}
/max_grid_size_z/{$NF = '$max_grid_size_z'}
/max_tile_size_y/{$NF = '$max_tile_size_y'}
/max_tile_size_z/{$NF = '$max_tile_size_z'}
/^[$]itlast/{$3 = 1}
/ADMBaseX::initial_data/{$NF = "\"Cartesian Minkowski\""}
/ADMBaseX::initial_lapse/{$NF = "one"}
/ADMBaseX::initial_shift/{$NF = "zero"}
/ADMBaseX::initial_dtlapse/{$NF = "zero"}
/ADMBaseX::initial_dtshift/{$NF = "zero"}
{print}
   ' /home/rhaas/postdoc/gr/cactus/carpetxbench/parfiles/headon_merger_benchX.par >$fn

   export OMP_NUM_THREADS=$threads
   mpirun -n $((8/$OMP_NUM_THREADS)) taskset 0xff /home/rhaas/postdoc/gr/cactus/CanudaX/exe/cactus_sim $fn &>${fn%.par}.log
fi
done
done
done
done
done
