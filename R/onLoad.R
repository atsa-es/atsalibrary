.onLoad <- function(libname, pkgname){
  vers <- c('3.0.0','1.10')
  pkgs <- c("ggplot2","rmarkdown")
  for(i in 1:length(pkgs)){
    if(!(pkgs[i] %in% rownames(installed.packages()))){
      if(packageVersion(pkgs[i]) < vers[i]) 
        install.packages(pkgs[i], repos = "https://cran.revolutionanalytics.com/")
    }
  }
}
