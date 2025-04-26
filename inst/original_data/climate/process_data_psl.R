library(dplyr)
library(tidyr)
library(readr)
library(lubridate)
library(stringr)
library(purrr)

# List of URLs
urls <- c(
  "https://psl.noaa.gov/data/correlation/pna.data",
  "https://psl.noaa.gov/data/correlation/epo.data",
  "https://psl.noaa.gov/data/correlation/wp.data",
  "https://psl.noaa.gov/data/correlation/censo.data",
  "https://psl.noaa.gov/data/correlation/whwp.data",
  "https://psl.noaa.gov/data/correlation/oni.data",
  "https://psl.noaa.gov/enso/mei/data/meiv2.data",
  "https://psl.noaa.gov/data/correlation/pdo.data",
  "https://psl.noaa.gov/data/timeseries/IPOTPI/ipotpi.hadisst2.data",
  "https://psl.noaa.gov/data/correlation/np.data",
  "https://psl.noaa.gov/data/correlation/pacwarm.data",
  "https://psl.noaa.gov/data/correlation/gmsst.data"
)

url <- urls[5]

# Helper: Get the climate index name from the URL
get_index_name <- function(url) {
  if (str_detect(url, "ipotpi.hadisst2.data")) {
    return("ipotpi")
  } else {
    return(str_remove(basename(url), "\\.data$"))
  }
}

# Main loop to read and process
climate_indices <- lapply(urls, function(url) {
  index_name <- get_index_name(url)
  
  # Print progress
  message("Processing: ", index_name, " (", url, ")")
  
  # Read raw lines
  lines <- read_lines(url)
  
  # Always skip the first line (bad header)
  lines <- lines[-1]
  
  # Trim leading/trailing spaces
  lines <- str_trim(lines, side = "both")
  
  # Keep only lines that have exactly 13 fields when splitting on whitespace
  good <- sapply(str_split(lines, "\\s+"), length) == 13 & str_detect(lines, "^\\s*\\d{4}\\s")
  # Keep only rows that start with a 4-digit year
  lines_clean <- lines[good]
  
  # Read into tibble
  df <- read_table2(
    paste(lines_clean, collapse = "\n"),
    col_names = FALSE,
    na = c("-99.90", "-99.99", "-999.00", "-999", "Missing")
  )
  
  # Rename columns
  colnames(df) <- c("year", month.abb)
  
  # Make sure all months are numeric
  df <- df %>%
    mutate(across(-year, as.numeric)) %>%
    filter(year >= 1800, year <= 2100)
  
  # Pivot longer
  df_long <- df %>%
    pivot_longer(-year, names_to = "month", values_to = index_name) %>%
    mutate(
      month = match(month, month.abb),
      date = as.Date(sprintf("%d-%02d-01", year, month))
    ) %>%
    select(date, year, month, all_of(index_name))
  
  return(df_long)
})

# Name the list elements
names(climate_indices) <- sapply(urls, get_index_name)

# Merge all into one wide data frame
climate_all_wide <- climate_indices %>%
  reduce(full_join, by = c("date", "year", "month")) %>%
  arrange(date)

# Preview
np_climate_month <- climate_all_wide

## Now create the seasonal yearly

library(dplyr)
library(tidyr)

# Use your existing data frame
# climate_all_wide has columns: date, year, month, pdo, pna, epo, wp, etc.

# Define seasons
get_season <- function(month) {
  case_when(
    month %in% c(1, 2, 3) ~ "winter",
    month %in% c(4, 5, 6) ~ "spring",
    month %in% c(5, 6, 7, 8) ~ "summer",
    month %in% c(9, 10, 11) ~ "fall",
    TRUE ~ NA_character_
  )
}

# Add 'season' column
climate_with_season <- climate_all_wide %>%
  mutate(season = get_season(month))

# Identify all climate indices
climate_vars <- setdiff(names(climate_with_season), c("date", "year", "month", "season"))

# Seasonal and annual means per index
climate_seasonal_list <- lapply(climate_vars, function(var) {
  
  df <- climate_with_season %>%
    select(year, season, month, value = all_of(var)) %>%
    filter(!is.na(value))
  
  # Seasonal means
  seasonal <- df %>%
    filter(!is.na(season)) %>%
    group_by(year, season) %>%
    summarise(value = mean(value, na.rm = TRUE), .groups = "drop") %>%
    pivot_wider(
      names_from = season,
      values_from = value,
      names_prefix = paste0(var, ".")
    )
  
  # Annual means
  annual <- df %>%
    group_by(year) %>%
    summarise(value = mean(value, na.rm = TRUE), .groups = "drop") %>%
    rename(!!paste0(var, ".annual") := value)
  
  # Combine
  combined <- left_join(seasonal, annual, by = "year") %>%
    arrange(year)
  
  return(combined)
})

# Combine all indices into a single data frame
climate_seasonal <- climate_seasonal_list %>%
  reduce(full_join, by = "year") %>%
  arrange(year)

# Preview
print(head(climate_seasonal))

np_climate_seasonal <- climate_seasonal

save(np_climate_month, np_climate_seasonal, file=here::here("data", "np_climate.RData"))

## Save a copy
# Download each file
library(fs)
for (url in urls) {
  # Get the filename (e.g., pna.data)
  filename <- basename(url)
  
  # Handle special naming case
  if (filename == "ipotpi.hadisst2.data") {
    filename <- "ipotpi.data"
  }
  
  # Local path
  destfile <- path("inst", "original_data", "climate", "raw_data", filename)
  
  message("Downloading: ", url)
  
  # Download
  download.file(url, destfile = destfile, mode = "wb")
}

