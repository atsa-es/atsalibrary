#' Northern Hemisphere land and ocean temperature anomalies
#'
#' @description Northern Hemisphere land and ocean temperature anomalies from NOAA
#' 
#' @details  From \url{https://www.ncdc.noaa.gov/cag/global/data-info}: 
#' "Global temperature anomaly data come from the Global Historical Climatology 
#' Network-Monthly (GHCN-M) data set and International Comprehensive Ocean-Atmosphere 
#' Data Set (ICOADS), which have data from 1880 to the present. These two datasets 
#' are blended into a single product to produce the combined global land and ocean
#'  temperature anomalies. The available timeseries of global-scale temperature anomalies 
#'  are calculated with respect to the 20th century average."
#' 
#'
#' @docType data
#' 
#' @name NHTemp
#'
#' @usage data(NHTemp)
#' 
#' @format Object of class \code{"data.frame"}.  Columns are Year and Value.
#' #'
#' @keywords datasets
#'
#' @source \href{https://www.ncdc.noaa.gov/cag/global/time-series}{NOAA Climate Monitoring}
#'
#' @examples
#' # We downloaded this data and created the `NHTemp` dataframe with the following code:
#' \dontrun{
#' library(RCurl)
#' ww1 <- "https://www.ncdc.noaa.gov/cag/time-series/"
#' ww2 <- "global/nhem/land_ocean/p12/12/1880-2014.csv"
#' NHTemp <- read.csv(text=getURL(paste0(ww1,ww2)), skip=4)
#' save(NHTemp, file="NHTemp.RData")
#' }
#' 
#' data(NHTemp)
"NHTemp"