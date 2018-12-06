library(tidyverse)
library(rvest)
library(naniar)

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

# Men
## 2018
badTable <- getBadTable("http://www.wisrunningstats.com/Marathon%20Honor%20Roll%202018_Men.htm")
names(badTable) <- c("Rank","x","y","Name", "City", "Time", "NA", "Race")
badTable <- final_cleanse(badTable)
write.csv(badTable, "wisconsinHR/cleanedData/2018M.csv", quote=FALSE, row.names = FALSE)

## 2017
badTable <- getBadTable("http://www.wisrunningstats.com/Marathon%20Honor%20Roll%202017_Men.htm")
names(badTable) <- c("Rank", "US Rank", "x", "Name", "City", "Time", "y", "Race")
badTable <- final_cleanse(badTable)
write.csv(badTable, "wisconsinHR/cleanedData/2017M.csv", quote=FALSE, row.names = FALSE)

## 2016
badTable <- getBadTable("http://www.wisrunningstats.com/Marathon%20Honor%20Roll%202016_Men.htm")
names(badTable) <- c("Rank", "US Rank", "x", "Name", "City", "Time", "y", "Race")
badTable <- final_cleanse(badTable)
write.csv(badTable, "wisconsinHR/cleanedData/2016M.csv", quote=FALSE, row.names = FALSE)

## 2015