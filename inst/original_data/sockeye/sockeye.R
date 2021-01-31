library(tidyverse)

## read PDO data downloaded from https://www.ncdc.noaa.gov/teleconnections/pdo/
url="https://www.ncdc.noaa.gov/teleconnections/pdo/"
pdo_dat <- read_csv("inst/original_data/sockeye/pdo_data.csv")

## separate `date` into `year` & `month`
pdo_mon <- pdo_dat %>%
  select(date, pdo) %>%
  mutate(year = as.integer(sub("(^[0-9]{4})([0-9]{2})", "\\1", date)),
         month = as.integer(sub("(^[0-9]{4})([0-9]{2})", "\\2", date)),
         ## assign summer & winter months to `period`
         period = ifelse(month >= 4 & month <= 9, "summer", "winter"),
         date = NULL) %>%
  select(year, month, period, pdo)

## create period means by year
pdo_yr <- pdo_mon %>%
  mutate(brood_year = year + 2) %>%
  group_by(brood_year, period) %>%
  summarise(pdo = mean(pdo)) %>%
  pivot_wider(names_from = period, values_from = pdo)

## read Kvichak sockeye data downloaded from RAM db
load("inst/original_data/sockeye/DBdata[asmt][v4.491].RData")

## get spawners
regs <- c("KVICHAK","WOOD", "IGUSHIK", "NAKNEK", 
          "EGEGIK", "NUSHAGAK", "UGASHIK",
          "TOGIAK")
sockeye <- c()
for(reg in regs){
  val <- paste0("SSALM", reg)
ssb.data$val <- ssb.data[,val]
tmp <- ssb.data %>%
  mutate(brood_year = as.integer(rownames(.)),
         count = val / 1000) %>%
  select(brood_year, count) %>%
  filter(!is.na(count))
tmp$region <- reg
tmp$type <- "spawners"
sockeye <- rbind(sockeye, tmp)
}

## get recruits
for(reg in regs){
  val <- paste0("SSALM", reg)
  r.data$val <- r.data[,val]
  tmp <- r.data %>%
    mutate(brood_year = as.integer(rownames(.)),
           count = val / 1000) %>%
    select(brood_year, count) %>%
    filter(!is.na(count))
  tmp$region <- reg
  tmp$type <- "recruits"
  sockeye <- rbind(sockeye, tmp)
}

## join pdo & abundance
sockeye_dat <- sockeye %>% 
  pivot_wider(names_from=type, values_from=count)
sockeye <- pdo_yr %>%
  inner_join(sockeye_dat, by = "brood_year") %>%
  mutate(pdo_summer_t2 = round(summer, 2),
         pdo_winter_t2 = round(winter, 2)) %>%
  select(brood_year, region, spawners, recruits, pdo_summer_t2, pdo_winter_t2)

save(sockeye, file="data/sockeye.RData")

a <- pivot_longer(sockeye,
                  cols=spawners:recruits,
                  names_to="value",
                  values_to="count")
ggplot(a,aes(brood_year, count, color=value, fill=value))+
  geom_area()+
  theme(axis.text.x = element_text(angle = 90)) +
  ylab("Count (thousands)") +
  xlab("Brood Year") +
  facet_wrap(~region, scales="free_y")