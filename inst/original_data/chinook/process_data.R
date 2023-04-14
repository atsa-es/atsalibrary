# NOAA Fisheries Office of Science and Technology, Commercial Landings Query, Available at: www.fisheries.noaa.gov/foss, Accessed 14 April 2023
a <- read.csv("inst/original_data/chinook/FOSS_yearly_landings_chinook.csv")
chinook.year <- a %>%
  mutate(State = stringr::str_to_sentence(State),
         metric.tons = readr::parse_number(Metric.Tons),
         log.metric.tons = log(metric.tons),
         value.usd = readr::parse_number(Dollars)) %>%
  select(Year, State, log.metric.tons, metric.tons, value.usd)

# Pacific Fisheries Information Network (PacFIN) retrieval dated 14 April 2023, Pacific States Marine Fisheries Commission, Portland, Oregon (www.psmfc.org). Available at https://reports.psmfc.org/pacfin
chinook.month <- NULL
for(i in c("Washington", "Oregon", "California")){
fil <- paste0("inst/original_data/west_coast_commercial/ALL006-", i, "-1990---2022.csv")
a <- read.csv(fil)
df1 <- a %>% subset(PACFIN_SPECIES_COMMON_NAME=="CHINOOK SALMON") %>%
  select("LANDING_YEAR", contains("LANDED_WEIGHT_MTONS")) %>%
  select(-contains("TOTAL")) %>%
  pivot_longer(cols=contains("LANDED_WEIGHT_MTONS")) %>%
  mutate(Month = stringr::str_sub(name, 1, 3) %>% stringr::str_to_sentence(),
         log.metric.tons = log(value)) %>%
  rename(metric.tons = value,
         Year = LANDING_YEAR) %>%
  select(Year, Month, log.metric.tons, metric.tons)
df2 <- a %>% subset(PACFIN_SPECIES_COMMON_NAME=="CHINOOK SALMON") %>%
  select("LANDING_YEAR", contains("EXVESSEL_REVENUE")) %>%
  select(-contains("TOTAL")) %>%
  pivot_longer(cols=contains("EXVESSEL_REVENUE")) %>%
  mutate(Month = stringr::str_sub(name, 1, 3) %>% stringr::str_to_sentence()) %>%
  rename(value.usd = value,
         Year = LANDING_YEAR) %>%
  select(Year, Month, value.usd)
df <- full_join(df1, df2, by = c("Year", "Month")) %>%
  mutate(
    State = stringr::str_sub(i, 1, 2) %>% stringr::str_to_upper(),
    Species = "Chinook") %>%
  select(Year, Month, Species, State, log.metric.tons, metric.tons, value.usd)
chinook.month <- bind_rows(chinook.month, df)
}

save(chinook.year, chinook.month, file=here::here("data", "chinook.RData"))


