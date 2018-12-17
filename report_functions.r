boston_tall_gen <- function(df){
  tmp <- df %>% mutate(seg1 = `5K`,
                                       seg2 = `10K` - `5K`,
                                       seg3 = `15K` - `10K`,
                                       seg4 = `20K` - `15K`,
                                       seg5 = `25K` - `20K`,
                                       seg6 = `30K` - `25K`,
                                       seg7 = `35K` - `30K`,
                                       seg8 = `40K` - `35K`) %>%
    select(seg1:seg8, Pace, `M/F`,ageN, top20Q)
  tmp <- tmp %>% mutate(pace1 = as.numeric(seg1)/3.10686,
                                        pace2 = as.numeric(seg2)/3.10686,
                                        pace3 = as.numeric(seg3)/3.10686,
                                        pace4 = as.numeric(seg4)/3.10686,
                                        pace5 = as.numeric(seg5)/3.10686,
                                        pace6 = as.numeric(seg6)/3.10686,
                                        pace7 = as.numeric(seg7)/3.10686,
                                        pace8 = as.numeric(seg8)/3.10686)
  tmp['Id'] <- seq(1, length(tmp$seg1))
  tmp <- tmp %>% mutate(relPace1 = pace1 / as.numeric(Pace),
                                        relPace2 = pace2 / as.numeric(Pace),
                                        relPace3 = pace3 / as.numeric(Pace),
                                        relPace4 = pace4 / as.numeric(Pace),
                                        relPace5 = pace5 / as.numeric(Pace),
                                        relPace6 = pace6 / as.numeric(Pace),
                                        relPace7 = pace7 / as.numeric(Pace),
                                        relPace8 = pace8 / as.numeric(Pace))
  final <- gather(tmp, segment, pace, relPace1:relPace8) %>% 
    select(Id, `M/F`, ageN, top20Q, Pace, segment, pace)
  names(final) <- c("Id", "Gender", "ageN", "top20Q", "marPace", "segment", "relPace")
  return(final)
}