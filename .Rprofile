#.libPaths("/Users/webb/miniconda3/lib/R/library")
options(repos=structure(c(CRAN="https://cloud.r-project.org/")))
options(menu.graphics=F)
library(data.table)
setDTthreads(0)
options(width=158) # here Sys.getenv('COLUMNS') == "" why??
q = function (save="no", ...) {
  quit(save=save, ...)
}
.Last = function(){
  if(interactive()){
    hist_file = Sys.getenv("R_HISTFILE")
    if(hist_file=="") hist_file = "~/.Rhistory"
    savehistory(hist_file)
  }
}
