#' Annual spawner data from Endangered and Threatened PNW salmonids
#'
#' @description The data set has yearly spawner counts for endangered and threatened ESU (Evolutionary Significant Units) and DPS (Distinct Population Segments) in the Washington and Oregon. Data were downloaded from  [Coordinated Assessments API](https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/). Coordinated 
#' Assessments data eXchange (CAX) is developed by the Coordinated Assessments Partnership (CAP).
#' 
#' @details There are two datasets included:  `esa.salmon` and `columbia.river`.  The Columbia River data set is a subset of the `esa.salmon` dataset that has all the ESUs and DPSs.
#' The dataset has the following columns
#' * species: Chinook, Coho, Steelhead, Chum, Sockeye
#' * esu_dps: name of the ESU
#' * majorpopgroup: biological major group
#' * commonpopname: common population name, generally a stream or river
#' * run: run-timing
#' * spawningyear: the year that the spawners were counted on the spawning grounds
#' * spawner: total (natural-born and hatchery-born) spawners on the spawning ground. Generally some type of redd-count expansion or some other stream count of spawners. Redd = a gravel nest.
#' * log.spawners: log of value
#' 
#' @docType data
#' 
#' @name esa_salmon
#' 
#' @aliases esa.salmon columbia.river
#'
#' @usage data(esa_salmon)
#' 
#' @format Objects of class \code{"data.frame"}.  Columns are species, 
#' esu_dps, majorpopgroup, commonpopname, run, spawningyear, spawner, log.spawner
#'
#' @keywords datasets
#'
#' @source 
#' \href{https://www.streamnet.org/cap/current-hli/}{CAP} StreamNet Coordinated Assessments Partnership (CAP) standardized high-level indicators (HLIs) for Natural Origin Spawner Abundance (NOSA).
#' 
#' @references 
#' rCAX: https://zenodo.org/records/10214433
#'
#' @examples
#' data(esa.salmon)
#' df <- esa.salmon %>% subset(species == "Steelhead" & run == "Winter")
#' ggplot(df, aes(x=spawningyear, y=log.spawner, color=majorpopgroup)) + 
#'   geom_point(size=0.2) + 
#'   theme(strip.text.x = element_text(size = 2)) +
#'   theme(axis.text.x = element_text(size = 5, angle = 90)) +
#'   facet_wrap(~esapopname)
"esa.salmon"
"columbia.river"