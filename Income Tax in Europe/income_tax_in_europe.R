

## libs
## library(tidyverse)
## library(sf)
## library(extrafont)

## Loading the Data 
map <- read_sf("europe.shp")
data <- read_xlsx("incometax.xlsx")

## Cleaning the Data 
data <- data %>% rename(name = Country) %>% mutate(name = toupper(name))

## Mergine the Datasets 

df <- inner_join(map , data , by = "name")

## Misc

font <- "Cambria"
bg <- "#403D58"

## plot
g <- ggplot() + geom_sf(data = df , aes(fill = Last) , color = ""#F2EFEA"") +
                   scale_fill_gradient(low = "#66D7D1" ,
                                       high = "#FC7753" ,
                                       name= "% Income Tax") +
                     theme(panel.grid = element_blank() ,
                           plot.background = element_rect(fill = "#403D58" ,
                                                          color = "#403D58"),
                           panel.background = element_rect(fill = "#403D58" ,
                                                           color = "#403D58"),
                           axis.text = element_blank() ,
                           legend.position = "bottom",
                           legend.direction = "horizontal",
                           legend.background = element_blank(),
                           plot.title = element_text(size = 18 ,
                                                     face = "bold" ,
                                                     color = "white" ,
                                                     family = "Cambria") ,
                           plot.subtitle = element_text(face = "bold" ,
                                                        size = 12) ,
                           text = element_text(family = "Cambria" ,
                                               color = "white")) +
labs(title = "Percent Income Tax Rate in European Countries ",
     subtitle = "While Scandinavian Countries has the highest income tax Rates in the World ,they still enjoy a vast majority of services. \n As opposed to Balkan Counties . In conclusion lower taxes doesn't lead to more satisfaction .",
     caption = "Data Source : TradingEconomics |Data Viz By : @AnalystNasher")
                   
## Editing the plot
ggdraw(g) + theme(panel.background = element_rect(fill = "#403D58",
                                                  colour = "#403D58"))
## Save
ggsave("incomcetax.png" ,
       plot = last_plot() ,
       width = 11.5 ,
       height = 8)
                   