suppressPackageStartupMessages(library(data.table))
library(arrow)
options(repos=list(CRAN="https://cran.biotools.fr/"))
options(width=158)
options(menu.graphics=F)
q = function (save="no", ...) quit(save=save, ...)
.Last = function() if(interactive()) savehistory("~/.Rhistory")
Sys.setenv(TZ='Europe/Amsterdam')
#library(tryCatchLog)
#library(futile.logger)
n_cores=ps::ps_cpu_count()
setDTthreads(n_cores) # speed up data.table
options(scipen=100)
options(keep.source=T)
read_feather = function(...){
	x = arrow::read_feather(...)
	setDT(x)
	x
}
rbindlist=function(l,use.names=T,fill=T,idcol=NULL) data.table::rbindlist(l=l,use.names=use.names,fill=fill,idcol=idcol)
rbind=function(...,use.names=T,fill=T,idcol=NULL) data.table::rbindlist(list(...),use.names=use.names,fill=fill,idcol=idcol)
write.tsv=function(x,file="",append=F,quote=F,sep="\t",eol="\n",na="NA",dec=".",row.names=F,col.names=T,qmethod=c("escape","double"),fileEncoding="") write.table(x=x,file=file,append=append,quote=quote,sep=sep,eol=eol,na=na,dec=dec,row.names=row.names,col.names=col.names,qmethod=qmethod,fileEncoding=fileEncoding) 
options(mc.cores=n_cores) # speed up mclapply
options(Ncpus=n_cores) # speed up install.packages
mclapply=function(X,FUN,...,mc.preschedule=T,mc.set.seed=T,mc.silent=F,mc.cores=getOption("mc.cores",2L),mc.cleanup=T,mc.allow.recursive=T,affinity.list=NULL){
	mc.cores = min(length(X),n_cores)
	parallel::mclapply(X=X,FUN=FUN,...,mc.preschedule=mc.preschedule,mc.set.seed=mc.set.seed,mc.silent=mc.silent,mc.cores=mc.cores,mc.cleanup=mc.cleanup,mc.allow.recursive=mc.allow.recursive,affinity.list=affinity.list)
}
rename=function(x,a,b){
	for(i in 1:length(a)){
		names(x)[names(x)==a[i]] = b[i]
	}
	x
}
