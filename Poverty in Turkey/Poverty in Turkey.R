## libs 
## install.packages("tidyverse")
## install.packages("sf")
## install.packages("extrafont")
## instll.packages("devtools")
## devtools::install_github("htastan/TRmaps")

## Importing the Data 
map <- tr_nuts2
data <- read.xlsx("poverty.xlsx")

## Cleaning the Data 
data <- data %>% drop_na() %>% mutate(code = str_sub(regioin , start = 1 , end = 4))
map <- map %>% rename(code = NUTS2_code)

## Merge
df <- innerjoin(map , data , by = "code)

## plot
ggplot() + geom_sf(data = df ,aes(fill = poverty_rate)) +
  scale_fill_gradientn(colours = c("#59CD90" , "#3FA7D6", "#EE6352")) +
  labs(title = "Poverty Rates in Turkey " ,
       caption = "Data Viz By :@AnalystNasher | Data Source :TÜRKSTAT" ,
       fill = "Poverty %") +
  theme(panel.grid = element_blank() ,
        panel.background = element_blank() ,
        plot.title = element_text(size = 25 ,
                                  colour = "#454955" ,
                                  face = "bold" , family = "Palatino Linotype",
                                  hjust = 0.5),
        plot.caption = element_text(size = 10 ,
                                    colour = "#454955",
                                    family = "Palatino Linotype"),
        axis.text.x = element_blank() ,
        axis.title.y = element_blank(),
        axis.ticks.x = element_blank() ,
        axis.text.y = element_blank() ,
        axis.ticks.y = element_blank() ,
        legend.position = "bottom" ,
        legend.text = element_text(size = 15 ,
                                   colour = "#454955" ,
                                   face = "bold" ,
                                   family = "Palatino Linotype") ,
        legend.title = element_text(size = 15 ,
                                    colour = "#454955" ,
                                    face = "bold" ,
                                    family = "Palatino Linotype"))

