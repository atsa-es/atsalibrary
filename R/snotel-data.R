#' Washington State SNOTEL measurements
#'
#' @description Monthly Snow Water Equivalent (SWE) at Stations in Washington State
#' 
#' @details These data are the snow water equivalent percent of normal. 
#' This represents the snow water equivalent (SWE) compared to the average value for 
#' that site on the same day. The data were downloaded from the USDA 
#' Natural Resources Conservation Service websited for the Washington Snow Survey Program.
#' 
#'
#' @docType data
#' 
#' @name snotel
#'
#' @usage data(snotel)
#' 
#' @format Objects of class \code{"data.frame"}.  Columns are Station, Station.Id, 
#' Year, Month, SWE, and Date
#'
#' @keywords datasets
#'
#' @source \href{https://www.nrcs.usda.gov/wps/portal/nrcs/main/wa/snow/}{USDA WA Snow Survey Program}
#'
#' @examples
#' data(greeklandings)
#' anchovy = ts(subset(greeklandings, Species=="Anchovy")$log.metric.tons, start=1964)
#' plot(anchovy)
#' 
#' library(ggplot2)
#' ggplot(greeklandings, aes(x=Year, y=log.metric.tons)) + 
#'       geom_line() + facet_wrap(~Species)
"greeklandings"