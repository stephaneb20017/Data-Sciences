my.data <- data.frame(federal.states=c("Baden-Württemberg","Bayern","Berlin","Brandenburg",
                                       "Bremen","Hamburg","Hessen", "Mecklenburg-Vorpommern",
                                       "Niedersachsen","Nordrhein-Westfalen","Rheinland-Pfalz",
                                       "Saarland","Sachsen","Sachsen-Anhalt","Schleswig-Holstein",
                                       "Thüringen"), 
                      Population=c(10716644,12691568,3469849,2457872,661888,1762791,6093888,1599138,
                                   7826739,17638098,4011582,989035,4055274,2235548,2830864,2156759))
str(my.data)


my.data$federal.states<-as.character(my.data$federal.states)
latlon <- geocode(my.data$federal.states)

my.data$federal.states[1]<-"Baden-Wurttemberg"
my.data$federal.states[16]<-"Thuringen Germany"

my.data <- cbind(my.data,latlon)
my.data2$lon <- latlon$lon; 
my.data2$lat <- latlon$lat
  
  
Germany <- ggmap(get_map(location="Germany",zoom=6), extent="panel")

circle_scale<-0.000002
Germany + geom_point(aes(x=lon,y=lat), 
                     data=my.data, 
                     col="red",
                     alpha=0.4,
                     size=my.data$Population*circle_scale)
