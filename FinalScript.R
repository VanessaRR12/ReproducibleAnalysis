#Final Report for LTERPlants Data

library(dplyr)
library(ggplot2)
library(knitr)

getwd()
LTERPlants<-read.csv("LTERPlants.csv")
View(LTERPlants)
summary(LTERPlants)

names(LTERPlants)
#columns of note:Latitude, Longitude, Species_Code, Shoot_Height, Flowering_Status, Plant_Biomass
df <- LTERPlants[ -c(5,7:9,) ]

#libraries and packages for all the maps
install.packages ("maps")
library(rworldmap)
library(maps)
library(mapproj)
install.packages("leaflet")
install.packages("mapview")
install.packages("leaflet.extras")
library(leaflet)
library(mapview)
library(leaflet.extras)

#ggplot map of georgia
#make lat and long objects to use for plot

plot_lat <-31.53863
plot_lon <--81.42254
georgiamap <- ggplot() + borders("state", region="Georgia") + coord_map("gilbert") + theme_wb() + geom_point(aes(x=plot_lon, y=plot_lat))
georgiamap

#ggplot map of georgia
#zoomed in to coordinates

plot_lat <-31.53863
plot_lon <--81.42254
georgiamap <- ggplot() + borders("state", region="Georgia") + coord_map("gilbert", xlim=c(-84, -81), ylim=c(31, 33 )) + theme_grey() + geom_point(aes(x=plot_lon, y=plot_lat))
georgiamap


#map of LTER site in Georgia
plot_lat <-31.53863
plot_lon <--81.42254
map("state", region=c("Georgia", "Mississippi"))
points(plot_lon, plot_lat, col="red")

map("county", "Georgia", xlim=c(-84, -81), ylim=c(31, 33))
points(plot_lon, plot_lat, col="blue", pch=17)

#leaflet map

m<- leaflet(quakes) %>% addTiles() %>% addHeatmap(lng = ~long, lat  = ~lat, radius=8)

webshot::install_phantomjs()
mapshot(m, file = "test.png")

m %>% addCircleMarkers(lng = LTERPlants$lon, lat = LTERPlants$lat)
