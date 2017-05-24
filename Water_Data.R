library(dplyr)
library(shiny)
library(ggplot2)
library(googleVis)
library(leaflet)
library(mapproj)
library(tidyverse)

#Read Ppopulation Data
pop <- read.csv("Data/Population_by_zip.csv",
                header = TRUE, stringsAsFactors = FALSE)
df_pop <- tbl_df(rename(pop, Zip = Zip.Code))

#Read Water usage
water <- read.csv("Data/Water_Electric_2005-2013_by_zip.csv",
                  header = TRUE, stringsAsFactors = FALSE)
df_water <- tbl_df(rename(water, Zip = Zip.Code))

#Read Income data

income <- read.csv("Data/MedAvgInc_CALosAngeles_Zips_2015.csv", 
                   header=TRUE, stringsAsFactors = FALSE)
df_income <- tbl_df(income)


#join income and pop by zip
income_pop_join <- full_join(df_pop, df_income, by = "Zip")
income_pop <- select(income_pop_join, Zip, Total.Population, Median.Age, Average.Household.Size, Median_Household_income, Mean_income, City)
df_income_pop <- tbl_df(income_pop)
arrange(df_income_pop, Zip)

#clean df_water
value_date <- as.Date(df_water$Value.Date)          #changes date format
rem_n <- gsub('\n',",",df_water$Zip)                #replaces \n with ,

#separate zip values
separate(df_water, df_water$Zip, c("Zip", "Long", "Lat"), sep = ",")

