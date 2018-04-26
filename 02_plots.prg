! === data representation ===

! == changing columns names, adding dimensions
! time in years 
name/column summary.tbl :times :time "y"  
! magnitude in both bands
name/column summary.tbl :j :j_band  "m" 
name/column summary.tbl :k :k_band  "m" 
! color index 
name/column summary.tbl :j_k :color_index "m" 
! == == == == == == == 

! == plotting ==
cre/gra

! band_j
plot/tab summary.tbl :time :j_band
copy/gra postscript graph_wnd001.plt
$ mv postscript.ps j.ps

! band_k
plot/tab summary.tbl :time :k_band
copy/gra postscript graph_wnd001.plt
$ mv postscript.ps k.ps

! color_index
plot/tab summary.tbl :time :color_index
copy/gra postscript graph_wnd001.plt
$ mv postscript.ps j-k.ps
! == == == == == == == 