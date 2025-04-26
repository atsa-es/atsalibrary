# Create data files
# remotes:::install_github("nwfsc-cb/rCAX@*release")
np_salmon <- readRDS("inst/original_data/north_pacific_salmon/ruggerone_data.rds")

# Summarise and pivot salmon returns by species
np_salmon_year <- np_salmon %>%
  group_by(year, species) %>%
  summarise(returns = sum(returns, na.rm = TRUE), .groups = "drop") %>%
  pivot_wider(names_from = species, values_from = returns)

# check that NAs are ok since using na.rm=T
na_counts <- np_salmon %>%
  group_by(region, species) %>%
  summarise(n_na = sum(is.na(returns)), 
            n_total = n(), 
            na_fraction = n_na / n_total, 
            .groups = "drop") %>%
  arrange(desc(na_fraction))
# looks fine. no NAs expect japan and that is all NAs
na_counts
save(np_salmon_year, np_salmon, file=here::here("data", "north_pacific_salmon.RData"))

