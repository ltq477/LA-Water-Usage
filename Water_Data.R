library(dplyr)
library(shiny)
library(ggplot2)
library(leaflet)
library(mapproj)

#Read Ppopulation Data
pop <- read.csv("Data/Population_by_zip.csv",
                header = TRUE, stringsAsFactors = FALSE)
df_pop <- tbl_df(rename(pop, Zip = Zip.Code))

#Read Water usage
water <- read.csv("Data/Water_Electric.csv",
                  header = TRUE, stringsAsFactors = FALSE)
df_water <- tbl_df(water)

#Read Income data
income <- read.csv("Data/MedAvgInc_CALosAngeles_Zips_2015.csv", 
                   header=TRUE, stringsAsFactors = FALSE)
df_income <- tbl_df(income)

#join income and population by zip
income_pop_join <- full_join(df_pop, df_income, by = "Zip")
income_pop <- select(income_pop_join, Zip, place_geoid, Total.Population, Median.Age, Average.Household.Size, Median_Household_income, Mean_income, City)
df_income_pop <- tbl_df(income_pop)
arrange(df_income_pop, Zip)

#Change Water date format
value_date <- as.Date(df_water$Value.Date)                #changes date format

#join income_pop and df_water
income_pop_water_join <- full_join(df_income_pop, df_water, by="Zip")
income_pop_water <- select(income_pop_water_join, Zip, Total.Population, Median_Household_income, Water.Use, Power.Use, place_geoid, Median.Age, Average.Household.Size, Mean_income, City)
df_income_pop_water <- tbl_df(arrange(income_pop_water, Zip))

#Final Data
WaterPopulationIncome <- df_income_pop_water

#Export to csv
write_csv(WaterPopulationIncome, "Data/WaterPopulationIncome.csv")


