library(dplyr)
library(shiny)
library(ggplot2)
library(googleVis)
library(leaflet)
library(mapproj)

Population_by_zip <- read.csv("Data/Population_by_zip.csv",
                              header = TRUE, stringsAsFactors = TRUE)

Water_use_zip <- read.csv("Data/LADWP_Water_use_by_zipcode.csv",
                          header = TRUE,
                          stringsAsFactors = TRUE)

Water_electric_by_zip <- read.csv("Data/Water_Electric_2005-2013_by_zip.csv",
                                  header = TRUE,
                                  stringsAsFactors = TRUE)
