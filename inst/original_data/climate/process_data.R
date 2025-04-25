pdo_url <- "https://www.ncei.noaa.gov/pub/data/cmb/ersst/v5/index/ersst.v5.pdo.dat"
pdo <- read.table(pdo_url, skip = 2, header = FALSE, check.names = FALSE)
pdo[pdo==99.99] <- NA
pdo_vec <- as.numeric(t(pdo[, 2:13]))
pdots <- ts(pdo_vec, freq=12, start=c(1854, 1))
library(zoo)
library(lubridate)
pdo_month <- data.frame(
  date = as.Date(as.yearmon(time(pdots))),
  pdo = as.numeric(pdots)
) %>%
  mutate(
    year = year(date),
    month = month(date, label = TRUE, abbr = TRUE)
  )
library(dplyr)
library(tidyr)

# Seasonal classification and means
pdo_seasonal <- pdodf %>%
  mutate(season = case_when(
    month %in% c("Jan", "Feb", "Mar") ~ "pdo.winter",
    month %in% c("Apr", "May", "Jun") ~ "pdo.spring",
    month %in% c("May", "Jun", "Jul", "Aug") ~ "pdo.summer",
    month %in% c("Sep", "Oct", "Nov") ~ "pdo.fall",
    TRUE ~ NA_character_
  )) %>%
  filter(!is.na(season)) %>%
  group_by(year, season) %>%
  summarise(pdo = mean(value, na.rm = TRUE), .groups = "drop") %>%
  pivot_wider(names_from = season, values_from = pdo)

# Annual average
pdo_annual <- pdodf %>%
  group_by(year) %>%
  summarise(pdo.annual = mean(value, na.rm = TRUE))

# Combine seasonal + annual
pdo_seasonal <- left_join(pdo_seasonal, pdo_annual, by = "year")

pdo_seasonal <- pdo_seasonal %>% arrange(year)


library(dplyr)
library(tidyr)
data("north_pacific_salmon")

# Summarise and pivot salmon returns by species
salmon_wide <- np_salmon %>%
  group_by(year, species) %>%
  summarise(returns = sum(returns, na.rm = TRUE), .groups = "drop") %>%
  pivot_wider(names_from = species, values_from = returns)

# Join with PDO indices
np_climate <- left_join(pdo_seasonal, salmon_wide, by = "year")

np_climate <- np_climate %>% arrange(year)

#save(np_climate, file=here::here("data", "pdo.RData"))

