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

### MADISON BASIC STATS
for(x in names(madison2015)){
  print(paste0(x, " - ", sum(is.na(madison2015[,x]))))
}

for(x in names(madison2016)){
  print(paste0(x, " - ", sum(is.na(madison2016[,x]))))
}

for(x in names(madison2017)){
  print(paste0(x, " - ", sum(is.na(madison2017[,x]))))
}

for(x in names(madison2018)){
  print(paste0(x, " - ", sum(is.na(madison2018[,x]))))
}

madison2015 <- madison2015 %>% mutate(nMiss = is.na(`10K`) + is.na(HALF) + is.na(`30K`))
madison2016 <- madison2016 %>% mutate(nMiss = is.na(`10K`) + is.na(Half) + is.na(`30K`))
madison2017 <- madison2017 %>% mutate(nMiss = is.na(`10K`) + is.na(Half) + is.na(`30K`))
madison2018 <- madison2018 %>% mutate(
  nMiss2 = is.na(`10K`) + 
    is.na(HALF.MARATHON) + is.na(`15.9.MILE`) + is.na(`20.MILE`))

table(madison2015$nMiss)
table(madison2016$nMiss)
table(madison2017$nMiss)
table(madison2018$nMiss)

### VAMT Analysis
df1['relDiff'] <- df1$diffPace / df1$fullPace
fit4 <- lm(relDiff ~ ageN * factor(gender) + factor(BQ) + factor(top10Q), data = df1)
