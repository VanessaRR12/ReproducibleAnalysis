setwd("~/school/R Class/LTER_Plants Project")
LTERPlants<-read.csv("PLT-GCEM-0303a_5_0.CSV - CleanedUpPLT-GCEM-0303a_5_0.CSV.csv")
View(LTERPlants)
summary(LTERPlants)

#Packages
install.packages ("dplyr")
Installpackages ("reader")
library (dplyr)
library (readr)
library(ggplot2)
library(vegan)

#create a date column
mydate <-paste(LTERPlants$year, LTERPlants$month, LTERPlants$day, sep="")
mydate
as.Date(mydate, "%Y%m%d")
mydate2 <-as.Date(mydate, "%Y%m%d")
str(mydate2)


#Column and row sorting
str(LTERPlants)
LTERPlants$Species_Code
LTERPlants$Shoot_Height
dropcols <-c("Flag_Latitude, Flag_Latitude")LTERPlants[c(1:3, 7),]

#Subsets of data from plot 1, subsets by species A1, A2, A3, A4, A5. Very few records for A5 so nothing shows up in that subset for plot 1.
# first subset
subset(LTERPlants, Plot == "1" & Species_Code == "A1")
subset(LTERPlants, Plot == "1" & Species_Code == "A2")
subset(LTERPlants, Plot == "1" & Species_Code == "A3")
subset(LTERPlants, Plot == "1" & Species_Code == "A4")
subset(LTERPlants, Plot == "1" & Species_Code == "A5")

#second subset
subset(LTERPlants, Plot == "1" & Plant_Biomass <5)
subset(LTERPlants, Plot == "1" & Plant_Biomass <10)
subset(LTERPlants, Plot == "1" & Plant_Biomass <15)

#Function-subtracting intial plant weight + new column with the new weights
function.MinusInitialWeight <- function(Plant_Biomass) {
  FMinusInitialWeight <- Plant_Biomass - .05
  return(FMinusInitialWeight)
}

function.MinusInitialWeight(LTERPlants$Plant_Biomass)
LTERPlants$NewWeight <-function.MinusInitialWeight(LTERPlants$Plant_Biomass)

