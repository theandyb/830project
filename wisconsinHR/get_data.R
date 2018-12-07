library(tidyverse)
library(rvest)
library(naniar)
library(RCurl)

getBadTable <- function(resUrl, start = 5, lastCol = 8){
  rawHTML <- read_html(resUrl)
  badTable <- rawHTML %>% html_nodes("table") %>% html_table()
  badTable <- badTable[[1]]
  badTable <- badTable[start:dim(badTable)[1],1:lastCol]
  return(badTable)
}

final_cleanse <- function(badTable){
  badTable <- badTable %>% select(Rank, Name, City, Time, Race) %>% 
    replace_with_na_all(condition = ~.x == "") %>%
    filter_all(any_vars(. != 0))
  return(badTable)
}

for (i in 2008:2018){
  HCURL <- paste0("http://www.wisrunningstats.com/Marathon%20Honor%20Roll%20", i, "_Men.htm")
  badTable <- getBadTable(HCURL)
  names(badTable) <- c("Rank", "US Rank", "x", "Name", "City", "Time", "y", "Race")
  badTable <- final_cleanse(badTable)
  outFile <- paste0("wisconsinHR/cleanedData/", i, "M.csv")
  write.csv(badTable, outFile, quote=FALSE, row.names = FALSE)
}

