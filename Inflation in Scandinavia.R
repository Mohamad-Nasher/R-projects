ggplot(data = data1 , mapping = aes(x = year , y = rate , color = Country)) +
  geom_line(size = 2) + geom_point(size = 3) + 
  labs(title = "A Decade of Scandinavian Inflation" 
       , x = "Year" 
       , y = "Inflation %" 
       , caption = "Data Source : EU Inflation Rate By Habib Gültekin | Data Viz by @AnalystNasher" ) + 
  theme_solarized() + 
  theme(panel.grid.major = element_blank()
        ,panel.grid.minor = element_blank() 
        ,panel.background = element_blank()
        ,panel.grid = element_blank()
        ,legend.key = element_blank()
        ,plot.title = element_text(family = "Rubik" , face = "bold",size = 15)
        ,legend.title = element_text(family = "Rubik",face = "bold" , size = 10)
        ,plot.caption = element_text(hjust = 1.2 , family = "Rubik")
        ,axis.title.x = element_text(family = "Rubik" , face = "bold")
        ,axis.title.y = element_text(family = "Rubik" , face = "bold")) + 
  scale_x_continuous(breaks = 2008:2019) + 
  scale_color_manual(values = c("#82E0AA","#002F6C","#BA0C2F","#FECC02")) + 
  annotate("curve" , x = 2013.2 , y = 0.15 , xend = 2014.8 , yend = -0.2 ,color ="darkgrey", curvature = 0.3 , arrow = arrow(length = unit(2 , "mm"))) + annotate("text" , x = 2012.25 , y = 0.17 , label = ("Finland Experiences \n -0.2 Deflation") , family = "Rubik" , color = "darkgrey" , fontface = "bold" , size = 4)