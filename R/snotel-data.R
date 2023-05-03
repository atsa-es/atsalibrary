#' Washington State SNOTEL measurements
#'
#' @description Monthly Snow Water Equivalent (SWE) at Stations in Washington State
#' 
#' @details These data are the snow water equivalent percent of normal. 
#' This represents the snow water equivalent (SWE) compared to the average value for 
#' that site on the same day. The data were downloaded from the USDA 
#' Natural Resources Conservation Service website for the Washington Snow Survey Program. The `snotel` object is the SWE data and the `snotelmeta` is the station metadata (lat/lon and elevation).
#' 
#'
#' @docType data
#' 
#' @name snotel
#'
#' @usage data(snotel)
#' 
#' @format 
#' * snotel: object of class \code{"data.frame"}.  Columns are Station, Station.Id, Year, Month, SWE, and Date
#' * snotelmeta: Station_Name, Station.Id, State.Code, Network.Code, Network.Name, Elevation, Latitude, Longitude"   
#'
#' @keywords datasets
#'
#' @source \href{https://www.nrcs.usda.gov/wps/portal/nrcs/main/wa/snow/}{USDA WA Snow Survey Program}
#'
#' @examples
#' data(snotel)
NULL 

#' @rdname snotel
"snotel"
#' @rdname snotel
"snotelmeta"
