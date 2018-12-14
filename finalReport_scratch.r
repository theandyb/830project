library(tidyverse)
library(broom)
library(naniar)

df1 <- read_tsv("data/marathon_wide.tsv")
boston2015 <- read_csv("data/boston/2015.csv")
boston2016 <- read_csv("data/boston/2016.csv")
boston2017 <- read_csv("data/boston/2017.csv")

madison2015 <- read_csv("data/madison/2015.csv")
madison2016 <- read_csv("data/madison/2016.csv")
madison2017 <- read_csv("data/madison/2017.csv")
madison2018 <- read_csv("data/madison/2018.csv")


# Replace "-" with NA in splits
boston2015 <- boston2015 %>% dplyr::na_if("-")
boston2016 <- boston2016 %>% dplyr::na_if("-")
boston2017 <- boston2017 %>% dplyr::na_if("-")
madison2015 <- madison2015 %>% dplyr::na_if("-")
madison2016 <- madison2016 %>% dplyr::na_if("-")
madison2017 <- madison2017 %>% dplyr::na_if("-")
madison2018 <- madison2018 %>% dplyr::na_if("-")

boston2015 <- type_convert(boston2015)
boston2016 <- type_convert(boston2016)
boston2017 <- type_convert(boston2017)
madison2015 <- type_convert(madison2015)
madison2016 <- type_convert(madison2016)
madison2017 <- type_convert(madison2017)
madison2018 <- type_convert(madison2018)

# Basic Stats: 2015

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

# Basic Stats: 2016

boston2016['secondHalf'] = boston2016$`Official Time` - boston2016$Half
boston2016['Diff'] <- boston2016$secondHalf - boston2016$Half

boston2016 %>% filter(`M/F` == "F") %>% pull(`Official Time`) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% filter(`M/F` == "F") %>% pull(`Official Time`) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% filter(`M/F` == "M") %>% pull(`Official Time`) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% filter(`M/F` == "M") %>% pull(`Official Time`) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% pull(`Official Time`) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% pull(`Official Time`) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()

boston2016 %>% filter(`M/F` == "F") %>% pull(Half) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% filter(`M/F` == "F") %>% pull(Half) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% filter(`M/F` == "M") %>% pull(Half) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% filter(`M/F` == "M") %>% pull(Half) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% pull(Half) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% pull(Half) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()

boston2016 %>% filter(`M/F` == "F") %>% pull(Diff) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% filter(`M/F` == "F") %>% pull(Diff) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% filter(`M/F` == "M") %>% pull(Diff) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% filter(`M/F` == "M") %>% pull(Diff) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% pull(Diff) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2016 %>% pull(Diff) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()

# Basic Stats: 2017
boston2017['secondHalf'] = boston2017$`Official Time` - boston2017$Half
boston2017['Diff'] <- boston2017$secondHalf - boston2017$Half

boston2017 %>% filter(`M/F` == "F") %>% pull(`Official Time`) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% filter(`M/F` == "F") %>% pull(`Official Time`) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% filter(`M/F` == "M") %>% pull(`Official Time`) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% filter(`M/F` == "M") %>% pull(`Official Time`) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% pull(`Official Time`) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% pull(`Official Time`) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()

boston2017 %>% filter(`M/F` == "F") %>% pull(Half) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% filter(`M/F` == "F") %>% pull(Half) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% filter(`M/F` == "M") %>% pull(Half) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% filter(`M/F` == "M") %>% pull(Half) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% pull(Half) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% pull(Half) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()

boston2017 %>% filter(`M/F` == "F") %>% pull(Diff) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% filter(`M/F` == "F") %>% pull(Diff) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% filter(`M/F` == "M") %>% pull(Diff) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% filter(`M/F` == "M") %>% pull(Diff) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% pull(Diff) %>% mean(na.rm =T) %>% lubridate::seconds_to_period()
boston2017 %>% pull(Diff) %>% sd(na.rm =T) %>% lubridate::seconds_to_period()