library(tidyverse)
library(here)
library(sf)
library(janitor)
library(dplyr)

report <- read_csv('/Users/jiangzhh98/Downloads/GitHub/UCL_work/GIS/Week4/Gender Inequality Index (GII).csv' , skip = 5)
report <- head(report, -2)

report2 <- report %>% dplyr::select("Country", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019") %>% clean_names()

shape <- st_read('/Users/jiangzhh98/Downloads/GitHub/UCL_work/GIS/Week4/World_Countries_(Generalized)/World_Countries__Generalized_.shp') %>% clean_names()

map <- left_join(shape, report2, by = c("country" = "country"))

library(tmap)
library(tmaptools)
tmap_mode("plot")
qtm(map,fill ="x2010")

report2 %>% summary()