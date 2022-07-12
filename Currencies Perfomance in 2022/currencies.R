

## libs
## library(tidyverse)
## library(extrafont)
## library(devtools)
## library(ggflags)
## library(ggthemes)

## Data (I Scrapped this data and cleaned it so it's ready)

data <- read.csv("currencies.csv")

## plot 
ggplot(data = data ,aes(x = reorder(Currency , Rank) , y = Percentage , fill = net)) +
  geom_bar(stat = "identity") +geom_text(aes(label = labelp ,
                                             vjust = -1.6 ),
                                         color = "white" ,
                                         face = "bold")+
  geom_text(aes(label = labele , vjust = 1.6),
            color = "white" , face = "bold")+
  scale_fill_manual(values = c("#E94F37" , "#7BD389"), name = "") +
  labs(title = "World Currencies Performance Since 2022" ,
       subtitle = "The War in Ukraine skyrocketed the Russian Ruble into an all time high .
       \n The War also drove the Euro into its lowest levels in 20 years",
       y = "Percentage Change %" ,
       x = "" ,
       caption = "Data Source : Investing | Data Viz : @AnalystNasher") +
  theme_minimal() +
  theme(legend.position = "none" ,
        panel.grid.major.x = element_blank(), 
        plot.background = element_rect(fill = "#272643" , colour = "#272643") ,
        axis.text.x = element_text(colour = "white" , size = 12),
        plot.subtitle = element_text(face = "bold" , hjust= 0.5 , colour = "white"),
        text = element_text(family = "Century Schoolbook" , size = 15 , colour = "white") ,
        axis.text.y = element_text(colour = "white"),
        panel.grid = element_blank() ,
        plot.caption = element_text(face = "bold" ,
                                    hjust = 0.5 ,
                                    colour = "white"),
        plot.title = element_text(face = "bold" ,
                                  size = 20 ,
                                  family = "Century Schoolbook",
                                  colour = "white" , hjust = 0.5)) +
  ggflags::geom_flag(aes(y = 0 , x = Currency , country = code) , size = 20)

## Save
ggsave("currencies.png" , dpi = 300 , height = 800 , width = 1100)