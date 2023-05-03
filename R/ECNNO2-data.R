#' UK Atmospheric NO2
#'
#' @description UK Environmental Change Network (ECN) atmospheric nitrogen chemistry data: 1993-2015 
#' 
#' @details  From \url{https://catalogue.ceh.ac.uk/documents/baf51776-c2d0-4e57-9cd3-30cd6336d9cf}: 
#' "Atmospheric Nitrogen Dioxide data from the UK Environmental Change Network (ECN) terrestrial sites. 
#' These data are collected by diffusion tubes at all of ECN's terrestrial sites using 
#' a standard protocol. They represent continuous fortnightly records from 1993 to 2015." The data in
#' ECNNO2 are the NO2 (micrograms/m3). Note although
#' the dataset information do not state this, I believe that the data are averaged iver the time exposure
#' (minutes), i.e. are micrograms/m3-minute, because the exposure time does not affect the N02 values in the
#' dataset, i.e. longer exposure does not equal higher NO2 values.  The link above has all the background
#' information on the dataset. The original data are taken every 7-31 days, with 14 days 
#' apart being the target
#' and most common time difference.  ECNNO2 is the monthly average of of all the 
#' readings for the experimental 
#' tubes. The average for the E1 tube will be average of the 1-3 E1 tubes from that month. 
#' Same for E2, E3 etc.
#' 
#' These data are part of a long-term monitoring program in the UK. N02 is just one 
#' component that is monitored.
#' The sites locations are in ECNmeta.
#' 
#' @references 
#' Rennie, S.; Adamson, J.; Anderson, R.; Andrews, C.; Bater, J.; Bayfield, N.; Beaton, K.; Beaumont, D.; Benham, S.; Bowmaker, V.; Britt, C.; Brooker, R.; Brooks, D.; Brunt, J.; Common, G.; Cooper, R.; Corbett, S.; Critchley, N.; Dennis, P.; Dick, J.; Dodd, B.; Dodd, N.; Donovan, N.; Easter, J.; Flexen, M.; Gardiner, A.; Hamilton, D.; Hargreaves, P.; Hatton-Ellis, M.; Howe, M.; Kahl, J.; Lane, M.; Langan, S.; Lloyd, D.; McCarney, B.; McElarney, Y.; McKenna, C.; McMillan, S.; Milne, F.; Milne, L.; Morecroft, M.; Murphy, M.; Nelson, A.; Nicholson, H.; Pallett, D.; Parry, D.; Pearce, I.; Pozsgai, G.; Rose, R.; Schafer, S.; Scott, T.; Sherrin, L.; Shortall, C.; Smith, R.; Smith, P.; Tait, R.; Taylor, C.; Taylor, M.; Thurlow, M.; Turner, A.; Tyson, K.; Watson, H.; Whittaker, M.; Wood, C. (2017). UK Environmental Change Network (ECN) atmospheric nitrogen chemistry data: 1993-2015. NERC Environmental Information Data Centre. 
#' \url{https://doi.org/10.5285/baf51776-c2d0-4e57-9cd3-30cd6336d9cf}
#'
#' @docType data
#' 
#' @name ECNNO2
#'
#' @usage data(ECNNO2)
#' 
#' @format ECNNO2 is the data and is an object of class \code{"data.frame"}.  
#' Columns are Year, Month, TubeID, SiteCode, and Value.  ECNmeta is the site locations.
#' 
#' @keywords datasets
#' 
#' @source \href{https://doi.org/10.5285/baf51776-c2d0-4e57-9cd3-30cd6336d9cf}{UK Centre for Ecolgoy & Hydrology}
#'
#' @examples
#' # Data were prepared from the downloaded data set as follows:
#' \dontrun{
#' library(tidyr)
#' library(reshape2)
#' dat <- read.csv("ECN_AN1.csv", stringsAsFactors = FALSE)
#' dat$Date <- as.Date(dat$SDATE, "%d-%B-%y")
#' dat$Year <- format(dat$Date, "%Y")
#' dat$Mon <- format(dat$Date, "%b")
#' a <- subset(dat, TUBEID %in% c("E1","E2","E3"))
#' b <- spread(a, FIELDNAME, VALUE)
#' b <- b[order(b$Date), ]
#' bad <- c(103, 104, 107:120) # bad quality codes. Burning nearby or contaminant in tube.
#' b$NO2[b$Q1 %in% bad | b$Q2 %in% bad | b$Q3 %in% bad] <- NA
#' val <- tapply(b$NO2, list(b$Year, b$Mon, b$TUBEID, b$SITECODE), mean, na.rm=TRUE)
#' dat.mon <- melt(data=val, value.name="NO2")
#' colnames(dat.mon) <- c("Year", "Month", "TubeID", "SiteCode", "Value")
#' dat.mon$Date <- as.Date(paste(1,dat.mon$Mon, dat.mon$Year), "%d %b %Y")
#' dat.mon <- dat.mon[order(dat.mon$Date),]
#' rownames(dat.mon) <- NULL
#' ECNNO2 <- dat.mon
#' }
#' 
#' data(ECNNO2)
NULL

#' @rdname ECNNO2
"ECNNO2"
#' @rdname ECNNO2
"ECNmeta"
