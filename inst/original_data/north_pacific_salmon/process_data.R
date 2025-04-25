# Create data files
# remotes:::install_github("nwfsc-cb/rCAX@*release")
np_salmon <- readRDS("inst/original_data/north_pacific_salmon/ruggerone_data.rds")
save(np_salmon, file=here::here("data", "north_pacific_salmon.RData"))

