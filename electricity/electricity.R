### libs
library(tidyverse)
library(showtext)



### Import Data
data <- read.csv("electricity.csv")


### Cleaning the Data 

data1 <- data %>% pivot_longer(cols = 5 : 66 , names_to = "year" , values_to = "access")
data2 <- data1 %>% filter(Country.Name == "Africa Eastern and Southern" | Country.Name == "Africa Western and Central" |
                            Country.Name == "World" | Country.Name == "East Asia & Pacific")
data3 <- data2 %>% filter(year == 2020) %>% mutate(label = paste(str_sub(access , start = 1 , end = 5), "%" , sep = ""))

### Misc
font_add_google(family = "Saria" , "Saria")
bg <- #151414
showtext.auto(enable = TRUE)

### Plot

ggplot(data = data3 , mapping = aes(x = year , y = access , color = Country.Name)) +
  geom_line(data = data2 , aes(x = year , y = access),size = 1.5) +
  geom_text(data = data3 ,family = "Saira" ,aes(x = year , y = access , label = label, hjust = -0.30)) +
  geom_point(data = data3 , aes(x = year , y = access),size = 2.5 , family = "Saira ExtraCondensed") +
  scale_color_manual(values = c("#0CCE6B" , "#DCED31" , "#EF2D56" , "#ED7D3A"))+
  labs(title = "Access To Electricity (% of Population)" ,
       caption = "Data Source World Bank Data | Data Viz By : @AnalystNasher" ,
       subtitle = "100 % of The European Union and North America have had  \n Access to Electricity Since 1990",
       x = "" ,
       y = "% of Population With Electricity") +
  xlim(1990 , 2021) + geom_text(data = data3 , aes(x = year ,family = "Saira", y = access , label = Country.Name),
                                size =4  , vjust = -1.5) +
  xlim(2000 , 2021)+
  theme(legend.position = "none" ,
        panel.background = element_blank() ,
        plot.background = element_rect(fill = bg ,
                                       colour = "#151414"),
        panel.grid = element_blank() , text = element_text(family = "Saira" ,
                                                           size = 15 ,
                                                           color = "white") ,
        axis.text = element_text(color = "white") ,
        plot.caption = element_text(hjust = 0.5) ,
        plot.title = element_text(size = 20))

### Save 

ggsave("electricity.png" , plot = last_plot() , dpi = 300 , height = 5 , width = 8)