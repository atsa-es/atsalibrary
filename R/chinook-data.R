#' Monthly and annual Chinook salmon commercial landings
#'
#' @description Monthly (WA and OR) and yearly (AK, CA, MI, OR, PA, and WA) data on 
#' commercial landings and value of Chinook salmon. Data were assembled by the NOAA Fisheries, 
#' Fisheries Statistics Division.
#' 
#' @details There are two datasets included:  chinook-month and chinook-year.  The monthly data are available from 1990 and the annual data are
#' available from 1950.  From the NOAA Fisheries Statistics Divison: "Collecting
#'  these data is a joint state and federal responsibility. 
#'  State-federal systems gather landings data from state-mandated fishery 
#'  trip-tickets, landing weighout reports from seafood dealers, 
#'  federal logbooks of fishery catch and effort, and shipboard and portside
#' interviews and biological sampling of catches. State fishery agencies are 
#' usually the main collectors of these data, though they and NOAA Fisheries 
#' gather data jointly in some states. Surveys are done differently 
#' in different states; NOAA Fisheries takes supplemental surveys to 
#' ensure that the data from different states and years are comparable."
#' 
#' In addition from NOAA Fisheries Statistics Division: 
#' "Statistics for each state represent a census of the volume and value of
#' finfish and shellfish landed and sold at the dock, not an expanded estimate
#' of landings based on sampling data. The main statistics collected are 
#' the pounds and ex-vessel dollar value of landings identified by species, 
#' year, month, state, county, port, water, and fishing gear. Most states 
#' get their landings data from seafood dealers who submit monthly reports 
#' of the weight and value of landings by vessel. Increasingly, though, 
#' states are getting landings data from mandatory trip-tickets—filled out 
#' by seafood dealers and fishermen at the end of every fishing trip, 
#' indicating their landings by species."
#' 
#'
#' @docType data
#' 
#' @name chinook
#' 
#' @aliases chinook-month chinook-year
#'
#' @usage data(chinook)
#' 
#' @format Objects of class \code{"data.frame"}.  Columns are Year, 
#' Month (if monthly), Species, State, log.metric.tons, metric.tons, and Value (USD)
#'
#' @keywords datasets
#'
#' @source \href{https://www.st.nmfs.noaa.gov/commercial-fisheries/commercial-landings/}{NOAA Commercial Landings Statistics}
#'
#' @examples
#' data(chinook)
#' dat <- subset(chinook.month, state="WA")$log.metric.tons
#' datts <- ts(dat, start=c(1990,1), frequency=12)
#' plot(datts)
"chinook.month"
"chinook.year"