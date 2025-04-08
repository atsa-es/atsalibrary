# atsalibrary

Routine tasks.

1. Run RMD check
2. Rebuild pkgdown with `pkgdown::build_site(lazy=FALSE)` and push to GitHub
3. Install all packages with
```
install.packages('atsalibrary', repos = c('https://atsa-es.r-universe.dev', 'https://cloud.r-project.org'), dependencies = TRUE)
```