#' Annual Anchovy, Sardine and Mackerel landings in Hellenic Waters 1964-2007
#'
#' @description Annual commercial landings of anchovy, sardine and mackerel
#' from Greek fisheries compiled by the Hellenic Statistical Authority.
#' Also included are covariates for the catch.
#' 
#' @details Data are from Table IV in the "Sea Fishery by Motor Vessels" statistical
#' reports published by the Hellenic Statisitcal Authority.  The reports
#' are available in Digital Library (\href{http://dlib.statistics.gr}{ELSTAT}), Special Publications, 
#' Agriculture-Livestock-Fisheries, Fisheries.
#' In Table IV, the landings data were taken from the total column, units are metric tons.
#' In the table, sardine is denoted ' Pilchard'. The data were assembled manually for the [Fish Forecast eBook](https://github.com/Fish-Forecast).
#' 
#' The covariates are Year, air.degC (air temperature), slp.millibars, sst.degC (sea surface temperature), vwnd.m/s (N/S wind speed), wspd3.m3/s3 (overall wind speed cubed). `covsmean.mon` and `covsmean.year` are averages over the 3 regions in the `covs` list. See the the [Fish Forecast eBook](https://github.com/Fish-Forecast) for details.
#'
#' @docType data
#' 
#' @name greeklandings
#'
#' @usage data(greeklandings)
#' 
#' @format Objects of class \code{"data.frame"}.  Columns are Year, Species, log.metric.tons, metric.tons
#'
#' @keywords datasets
#'
#' @source \href{http://dlib.statistics.gr/portal/page/portal/ESYE}{Hellenic Statisitcal Authority Digital Library}
#'
#' @examples
#' data(greeklandings)
#' anchovy = ts(subset(greeklandings, Species=="Anchovy")$log.metric.tons, start=1964)
#' plot(anchovy)
#' 
#' library(ggplot2)
#' ggplot(greeklandings, aes(x=Year, y=log.metric.tons)) + 
#'       geom_line() + facet_wrap(~Species)
NULL

NULL 

#' @rdname greeklandings
"greeklandings"
#' @rdname greeklandings
"covs"
#' @rdname greeklandings
"covsmean.year"
#' @rdname greeklandings
"covsmean.mon"
