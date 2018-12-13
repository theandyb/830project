library(tidyverse)
library(broom)

df1 <- read_tsv("data/marathon_wide.tsv")
boston2015 <- read_csv("data/boston/2015.csv") 

boston2015['secondHalf'] = boston2015$`Official Time` - boston2015$Half
boston2015['Diff'] <- boston2015$secondHalf - boston2015$Half

boston2015 %>% filter(`M/F` == "F") %>% pull(`Official Time`) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% filter(`M/F` == "F") %>% pull(`Official Time`) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% filter(`M/F` == "M") %>% pull(`Official Time`) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% filter(`M/F` == "M") %>% pull(`Official Time`) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% pull(`Official Time`) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% pull(`Official Time`) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()

boston2015 %>% filter(`M/F` == "F") %>% pull(Half) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% filter(`M/F` == "F") %>% pull(Half) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% filter(`M/F` == "M") %>% pull(Half) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% filter(`M/F` == "M") %>% pull(Half) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% pull(Half) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% pull(Half) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()

boston2015 %>% filter(`M/F` == "F") %>% pull(Diff) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% filter(`M/F` == "F") %>% pull(Diff) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% filter(`M/F` == "M") %>% pull(Diff) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% filter(`M/F` == "M") %>% pull(Diff) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% pull(Diff) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2015 %>% pull(Diff) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()