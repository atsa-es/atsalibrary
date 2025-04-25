# Create data files
# remotes:::install_github("nwfsc-cb/rCAX@*release")
bristol_bay_data_plus_covariates <- readRDS("inst/original_data/bristol_bay/bristol_bay_data_plus_covariates.rds")
bb_sockeye <- bristol_bay_data_plus_covariates
save(bb_sockeye, file=here::here("data", "bristol_bay_sockeye.RData"))

