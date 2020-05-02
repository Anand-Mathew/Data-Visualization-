library(dplyr)
library(tidyverse)
library(gganimate)
library(gapminder)
library(gifski)

a2<- read.csv("deliveries.csv")



b1<- a2 %>% 
  group_by(batsman,Year) %>% 
  summarise(Runs.per.year=sum(total_runs)) 



  
p321 <- b1  %>%
  # build rank, labels and relative values
  group_by(Year) %>%
  mutate(Rank = rank(-Runs.per.year),
         Value_rel = Runs.per.year/Runs.per.year[Rank==1],
         Value_lbl = paste0(" ",round(Runs.per.year))) %>% 
  group_by(batsman) %>%
  filter(Rank <= 10) %>%  ggplot(aes(-Rank,Runs.per.year, fill = batsman)) +
  geom_col(width = 0.8, position="identity") +
  coord_flip() + 
  geom_text(aes(-Rank,y=0,label = batsman,hjust=0)) +       #country label
  geom_text(aes(y = Runs.per.year,
                       label = scales::comma(Runs.per.year)), hjust = 0, nudge_y = 70 ) +
  geom_text(aes(x=-10,y=800, label=paste0(Year)), size=16, color = 'gray45') +labs(title = 'Top 10 Run Scorers',
                                                                                                   subtitle = 'For years 2008-2016',
                                                                                                   caption = 'IPL dataset ',
                                                                                                   x = '',
                                                                                                   y = '')+
  
                  theme_minimal() +
  theme(legend.position = "none",axis.title = element_blank()) +theme(plot.title = element_text(size = 50, face = "bold", hjust = 0.5))+
  # animate along Year
  transition_states(Year,4,1) +
  ease_aes("cubic-in-out")



gganimate::animate(p321, fps = 25, duration = 16 , width = 800, height = 600, renderer = gifski_renderer("anim.gif"))




