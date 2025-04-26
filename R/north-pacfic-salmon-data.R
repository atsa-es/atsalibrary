#' North Pacific Pink, Chum and Sockeye Salmon Abundance 1925-2015
#'
#' @description Total abundance of natural spawners (not hatchery) from 15 regions in the N Pacific. 
#' These are data provided with Ruggerone, G. and Irvine, J. 2018. Numbers and biomass of 
#' natural- and hatchery-origin Pink, Chum, and Sockeye Salmon in the North Pacific Ocean, 1925-2015. 
#' Marine and Coastal Fisheries: Dynamics, Management, and Ecosystem Science 10. DOI: 10.1002/mcf2.10023. 
#' 
#' A total abundance data frame of pink, chum and sockeye summed across all regions is also provided.
#' 
#' @details The full data have the columns:
#' * year
#' * region: ci e_kam japan kod korea m_i nbc pws sbc seak s_pen wa wak w_kam wc
#' * returns
#' * species: pink chum sockeye
#'  
#' The year (total abundance) data have the columns:
#' * year
#' * chum, pink, sockeye
#' and are the sum across all regions (with na.rm=TRUE).
#' 
#' @docType data
#' 
#' @name north_pacific_salmon
#' 
#' @aliases np_salmon
#' @aliases np_salmon_year
#' 
#' @usage data(north_pacific_salmon)
#' 
#' @format Objects of class \code{"data.frame"}.  
#' 
#' @keywords datasets
#' 
#' @references 
#' Ruggerone, G. and Irvine, J. 2018. Numbers and biomass of 
#' natural- and hatchery-origin Pink, Chum, and Sockeye Salmon in the North Pacific Ocean, 1925-2015. 
#' Marine and Coastal Fisheries: Dynamics, Management, and Ecosystem Science 10. DOI: 10.1002/mcf2.10023.
#' 
#' @examples
#' data(north_pacific_salmon)
#' np_salmon %>% 
#'   filter(species=="pink") %>% 
#'   ggplot(aes(x=year, y=log(returns))) + 
#'   geom_line() + 
#'   ggtitle("pink salmon log abundance") +
#'   facet_wrap(~region)
#'   
#'   np_salmon_year %>%
#'   pivot_longer(cols = c(pink, chum, sockeye), names_to = "species", values_to = "returns") %>%
#'   ggplot(aes(x = year, y = log(returns))) +
#'   geom_line() +
#'   facet_wrap(~ species, scales = "free_y") +
#'   labs(title = "Log returns of salmon species", 
#'        y = "log(returns)",
#'        x = "Year") +
#'   theme_minimal()
"np_salmon"
"np_salmon_year"