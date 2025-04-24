# Create data files
# remotes:::install_github("nwfsc-cb/rCAX@*release")
library(rCAX)
library(tidyr)
library(stringr)
library(dplyr)
x <-  rCAX:::caxesu
valid_esu <- which(!str_detect(x, "XN") & !str_detect(x,"N/A"))
esa.salmon <- NULL
for(i in valid_esu){
  esuname <- rCAX:::caxesu[i]
  print(esuname)
  a <- rcax_hli("NOSA", type="colnames")
  tab <- rcax_hli("NOSA", flist = list(esu_dps = esuname))
  # error no data
  if (!is.data.frame(tab)) next
  # find the pops with no data and remove
  tab <- tab %>% 
    subset((datastatus == "Final" | datastatus == "Reviewed") & bestvalue=="Yes")
  if(tab$tsaej[1]=="") tab$value <- tab$tsaij else tab$value <- tab$tsaej
  aa <- tab %>% 
    group_by(esapopname, run) %>% 
    summarize(n = sum(value!= "" & value!="0" & majorpopgroup != ""))
  bad <- aa[which(aa$n==0),]
  aa <- tab %>% 
    group_by(esapopname, run) %>% 
    summarize(n = any(duplicated(spawningyear)))
  df <- tab %>% 
    subset(!(esapopname %in% bad$esapopname & run %in% bad$run)) %>%
    mutate(value = as.numeric(value))
  
  # get the min and max years in data
  years <- min(df$spawningyear[!is.na(df$value)]):max(df$spawningyear[!is.na(df$value)])
  # fill out the missing years with NAs
  df <- df %>%
    select(species, esu_dps, majorpopgroup, esapopname, commonpopname, spawningyear, value, run) %>% 
    group_by(species, esu_dps, majorpopgroup, esapopname, commonpopname, run) %>% 
    complete(spawningyear=years, fill=list(value=NA))
  
  # Deal with pops with multiple data
  if(any(aa$n)){
    cat(aa$esapopname[aa$n], "has duplicated years\n")
    df <- df %>% ungroup() %>%
      group_by(species, esu_dps, majorpopgroup, esapopname, run, spawningyear) %>%
      summarize(value = mean(value, na.rm = TRUE,
                             commonpopname = commonpopname[1]))
  }
  esa.salmon <- bind_rows(esa.salmon, df)
}
esa.salmon <- esa.salmon %>% subset(species != "") %>% ungroup()
esa.salmon$log.spawner <- log(esa.salmon$value)
esa.salmon <- rename(esa.salmon, spawner = value)

columbia.river <- NULL
for(i in c(17, 20, 15, 11, 2)){
  esuname <- rCAX:::caxesu[i]
  a <- rcax_hli("NOSA", type="colnames")
  tab <- rcax_hli("NOSA", flist = list(esu_dps = esuname))
  # find the pops with no data and remove
  tab <- tab %>% 
    subset((datastatus == "Final" | datastatus == "Reviewed") & bestvalue=="Yes")
  if(i == 17 | i == 20) tab$value <- tab$tsaij else tab$value <- tab$tsaej
  aa <- tab %>% 
    group_by(esapopname, run) %>% 
    summarize(n = sum(value!= "" & value!="0" & majorpopgroup != ""))
  bad <- aa[which(aa$n==0),]
  aa <- tab %>% 
    group_by(esapopname, run) %>% 
    summarize(n = any(duplicated(spawningyear)))
  df <- tab %>% 
    subset(!(esapopname %in% bad$esapopname & run %in% bad$run)) %>%
    mutate(value = as.numeric(value))
  
  # get the min and max years in data
  years <- min(df$spawningyear[!is.na(df$value)]):max(df$spawningyear[!is.na(df$value)])
  # fill out the missing years with NAs
  df <- df %>%
    select(species, esu_dps, majorpopgroup, esapopname, commonpopname, spawningyear, value, run) %>% 
    group_by(species, esu_dps, majorpopgroup, esapopname, commonpopname, run) %>% 
    complete(spawningyear=years, fill=list(value=NA))
  
  # Deal with pops with multiple data
  if(any(aa$n)){
    cat(aa$esapopname[aa$n], "has duplicated years\n")
    df <- df %>% ungroup() %>%
      group_by(species, esu_dps, majorpopgroup, esapopname, run, spawningyear) %>%
      summarize(value = mean(value, na.rm = TRUE,
                             commonpopname = commonpopname[1]))
  }
  if(i == 17 | i == 20) df$value_type <- "tsaij" else df$value_type <- "tsaej"
  columbia.river <- bind_rows(columbia.river, df)
}
columbia.river <- columbia.river %>% subset(species != "") %>% ungroup()
columbia.river$log.spawner <- log(columbia.river$value)
columbia.river <- rename(columbia.river, spawner = value)
save(esa.salmon, columbia.river, file=here::here("data", "esa_salmon.RData"))

