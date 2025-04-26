#' North Pacific Climate Indices: Monthly and Seasonal Means
#'
#' Datasets containing **monthly**, **seasonal**, and **annual** averages of climate indices
#' relevant to the North Pacific.
#' All indices are sourced from [NOAA PSL Climate Indices](https://psl.noaa.gov/data/climateindices/list/).
#'
#' ## Monthly Data: `np_climate_month`
#'
#' Climate indices recorded at monthly resolution.
#'@format A data frame with one row per month:
#' \describe{
#'   \item{date}{Date of the observation (first day of month).}
#'   \item{year}{Year.}
#'   \item{month}{Month name (e.g., "Jan", "Feb", etc.).}
#'   \item{pna}{Pacific-North American pattern (PNA) index. Measures atmospheric variability over North America and the North Pacific.}
#'   \item{epo}{East Pacific Oscillation (EPO) index. Measures pressure anomalies across the eastern North Pacific.}
#'   \item{wp}{Western Pacific (WP) pattern index. Describes variability over the western Pacific and eastern Asia.}
#'   \item{censo}{Central ENSO (CENSO) index. ENSO variability focusing on central Pacific SST anomalies.}
#'   \item{whwp}{Western Hemisphere Warm Pool (WHWP) index. Measures the area of ocean surface temperatures >28.5°C in the Atlantic and eastern Pacific.}
#'   \item{oni}{Oceanic Niño Index (ONI). A common index to monitor El Niño/La Niña events.}
#'   \item{meiv2}{Multivariate ENSO Index Version 2 (MEI.v2). A multivariate index combining several ENSO-related variables.}
#'   \item{pdo}{Pacific Decadal Oscillation (PDO) index. Long-term ocean temperature fluctuations in the North Pacific.}
#'   \item{ipotpi}{Indo-Pacific Ocean Temperature Pattern Index (IPOTPI). Measures SST patterns related to tropical Indo-Pacific variability.}
#'   \item{np}{North Pacific Index (NPI). Area-averaged sea level pressure over the North Pacific.}
#'   \item{pacwarm}{Pacific Warm Pool index (PACWARMPOOL). Area-averaged SST anomalies in the warm pool region of the Pacific.}
#'   \item{gmsst}{Global Mean Sea Surface Temperature (GMSST) anomalies.}
#' }
#'
#' ## Seasonal and Annual Data: `np_climate_seasonal`
#'
#' Seasonal and annual averages of each climate index.
#'
#' Seasons are defined as:
#' \itemize{
#'   \item{\strong{Winter}}: January, February, March
#'   \item{\strong{Spring}}: April, May, June
#'   \item{\strong{Summer}}: May, June, July, August
#'   \item{\strong{Fall}}: September, October, November
#' }
#' 
#' Note: Some months (May and June) are included in both spring and summer means.
#'
#' @format A data frame with one row per year:
#' \describe{
#'   \item{year}{Year.}
#'   \item{<index>.<season>}{Mean index value for that season (e.g., `pdo.spring`, `oni.winter`).}
#'   \item{<index>.annual}{Annual mean across all months for that index (e.g., `pdo.annual`, `oni.annual`).}
#' }
#'
#' @docType data
#' 
#' @name np_climate
#' 
#' @aliases np_climate_month
#' @aliases np_climate_seasonal
#' 
#' @usage data(np_climate)
#' 
#' @format Objects of class \code{"data.frame"}.  
#' 
#' @keywords datasets
#' 
#' @source \url{https://psl.noaa.gov/data/climateindices/list/}
#'
#' @examples
#' # Monthly PDO example
#' library(ggplot2)
#' ggplot(np_climate_month, aes(x = date, y = pdo)) +
#'   geom_line() +
#'   labs(title = "Pacific Decadal Oscillation (PDO) - Monthly",
#'        x = "Year",
#'        y = "PDO Index") +
#'   theme_minimal()
#'
#' # Annual PDO example
#' ggplot(np_climate_seasonal, aes(x = year, y = pdo.annual)) +
#'   geom_line() +
#'   labs(title = "Pacific Decadal Oscillation (PDO) - Annual Mean",
#'        x = "Year",
#'        y = "PDO Index (Annual Mean)") +
#'   theme_minimal()
"np_climate_month"
"np_climate_seasonal"