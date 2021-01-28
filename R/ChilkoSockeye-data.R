#' Chilko River SR Data
#'
#' @description Spawner-recruit data for sockeye salmon from the Chilko River.
#' 
#' @details Spawner-recruit data for sockeye salmon 
#' (_Oncorhynchus nerka_) from the Chilko River
#'  in SW Alaska that span the years 1948-1986. The data come from a large 
#'  public database begun by Ransom Myers many years ago. The 
#'  database is now maintained as the RAM Legacy Stock Assessment Database.
#'
#' @docType data
#' 
#' @name ChilkoSockeye
#'
#' @usage data(ChilkoSockeye)
#' 
#' @format Object of class \code{"data.frame"}.  
#' Columns are brood.yr, Sp (Spawners), Rec (Recruits), PDO.t2, and PDO.t3.
#' \itemize{
#'   \item \strong{brood.yr}  Brood year. 
#'   \item \strong{Sp} Spawners (count) 
#'   \item \strong{Rec} Recruits (count) 
#'   \item \strong{PDO.t2} Pacific Decadal Oscillation (PDO) at year $t-2$ 
#'   \item \strong{PDO.t3} Pacific Decadal Oscillation (PDO) at year $t-3$ 
#' }
#' 
#' @keywords datasets
#'
#' @source \href{https://www.ramlegacy.org/}{RAM Legacy Stock Assessment Database}
#'
#' @references 
#' RAM Legacy Stock Assessment Database. 2018. Version 4.44-assessment-only. Released 2018-12-22. Accessed [Date accessed YYYY-MM-DD]. Retrieved from DOI:10.5281/zenodo.2542919.
#' 
#' Ricard, D., Minto, C., Jensen, O.P. and Baum, J.K. (2012) Evaluating the knowledge base and status of commercially exploited marine species with the RAM Legacy Stock Assessment Database. Fish and Fisheries 13 (4) 380-398. DOI: 10.1111/j.1467-2979.2011.00435.x
#'     
#' @examples
#' data(ChilkoSockeye)
"ChilkoSockeye"