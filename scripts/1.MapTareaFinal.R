#Map to plot the location of each sample, the different areas are differentiated by different colors.

#Change language settings in English (to get error/comment messages in English).
Sys.setenv(LANG = "en") 

#Packages needed:
library("sf")
library("ggspatial")
library("raster")
library("ggrepel")
library("dplyr")

#To charge the folder with the area/population with the localisation (latitud, longitud).
BE_pop <- read.csv('../meta/eduleTareafinal_pop.txt', sep='\t', header = TRUE)

#To define each area, and it is the opportunity to rename the area with a shorter name. 
Comitan <- filter(BE_pop, Area=="Comitan")
Cuicatlan <- filter(BE_pop, Area=="Cuicatlan")
EDO.CUE <- filter(BE_pop, Area=="EDO CUE")
San_Cristobal <- filter(BE_pop, Area=="San Cristobal")
Tuxtla <- filter(BE_pop, Area=="Tuxtla G.")
Xalalpa <- filter(BE_pop, Area=="Xalapa")

#To plot the Mexican map
dfMexicoRegion <- getData("GADM", country = "MEXICO", level = 1) %>% st_as_sf()
dfMexicoRegion %>% 
  ggplot()+
  geom_sf() +
  coord_sf(xlim=c(-101,-89.5), ylim=c(14,22.7), expand = FALSE) + #To define the map limitation
  annotation_scale(location = "bl", width_hint = 0.5) + #To add a scale bar
  annotation_north_arrow(location = "bl", which_north = "true", pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"), style = north_arrow_fancy_orienteering) + #To add an arrow showing the north direction
  xlab("") + ylab ("") +
  theme(panel.grid.major = element_line(color = gray(.5), linetype = "dashed", size = 0.5), panel.background = element_rect(fill = "white")) + #To set the colors of the map
  geom_point(data=Comitan, aes(Longitud, Latitud), col="brown") + #To plot each area with a different color 
  geom_point(data=Cuicatlan, aes(Longitud, Latitud), col="red") +
  geom_point(data=EDO.CUE, aes(Longitud, Latitud), col="orange")+
  geom_point(data=San_Cristobal, aes(Longitud, Latitud), col="#2daa71")+
  geom_point(data=Tuxtla, aes(Longitud, Latitud), col="#e947c2") +
  geom_point(data = Xalalpa, aes(Longitud, Latitud), col="blue") 
