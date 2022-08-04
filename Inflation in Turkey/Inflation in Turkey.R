## libs
library(tidyverse)
library(gganimate)
library(ggthemes)
library(gifski)
library(av)
library(showtext)
library(lubridate)
library(devtools)
library(TRmaps)
library(sf)
library(openxlsx)

## Data 

data <- read.xlsx("inflation.xlsx" , fillMergedCells = TRUE)

data <- data %>% mutate(code = str_sub(region , start = -4))

data <- data %>% mutate(date1 = paste(year , str_sub(date , start = 1 , end = 2 ) , "01" , sep = "-"))

data <- data %>% mutate(date1 = ymd(date1))

map <- tr_nuts2

map <- map %>% rename(code = NUTS2_code)

df <- inner_join(map , data , by = "code")

## Misc 

font <- "Saira Extra Condensed"
font_add_google(family=font, font)
showtext_auto(enable = TRUE) 
theme_set(theme_minimal(base_family = font))
txt_col <- "grey20"

## Plot

p <- ggplot() + geom_sf(data = df , aes(fill = inflation)) + labs(title = "Inflation in Turkey (2005-2022)" ,
                                                                  caption = "Data Source : TÜRKSTAT | Data Viz : Mohamad Nasher") +
  theme_map() +
  scale_fill_gradient(low = "#F6DB79" , high = "#BE2323" , name = "Inflation %")  +
  theme(plot.title = element_text(family = font ,
                                  size = 20 ,
                                  face = "bold" ,
                                  hjust = 0.10 ,
                                  colour = txt_col) ,
        legend.direction = "horizontal" ,
        legend.background = element_blank()  ,
        plot.caption = element_text(hjust = 0.5 ,
                                    family = font ,
                                    color = txt_col ,
                                    size = 15 ,
                                    face = "bold") ,
        legend.text = element_text(family = font ,
                                   color = txt_col ,
                                   face = "bold" ,
                                   size = 10) ,
        text = element_text(family = font) ,
        legend.title = element_text(family = font ,
                                    color = txt_col ,
                                    face = "bold" ,
                                    size = 15) ,
        plot.subtitle = element_text(hjust = 0.10),
        legend.position = c(0.80,1)) + guides(fill=guide_colorbar(ticks.colour = NA, title.position = "top", title.hjust = .5))

## Animating 

anim <-p + transition_time(date1) + labs(subtitle = "{frame_time}")

animate(anim , height = 800 , width = 500 , end_pause = 60)

## Save 

anim_save("Inflation in Turkey.gif" , animation = last_animation())





