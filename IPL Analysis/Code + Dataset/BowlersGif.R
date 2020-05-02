a<- read.csv("deliveries.csv")


b12<- a %>% 
  filter( dismissal_kind == "caught" |dismissal_kind == "bowled" |dismissal_kind == "run out" |dismissal_kind == "lbw" |dismissal_kind == "stumped" |dismissal_kind == "caught and bowled" | dismissal_kind == "hit wicket"   ) %>% 
  group_by(bowler,Year) %>% 
  summarise( dismissals = n()) %>%
  arrange(desc(dismissals)) %>% 
  distinct(Year,dismissals)


p32 <- b12  %>%
  # build rank, labels and relative values
  group_by( Year ) %>%
  mutate(Rank = rank(-dismissals),
  ) %>% 
  group_by(bowler) %>%
  filter(Rank <= 10) %>%  ggplot(aes(-Rank,dismissals, fill = bowler)) + 
  geom_col(width = 0.8, position="identity") +
  coord_flip() + 
  geom_text(aes(-Rank,y=0,label = bowler,hjust= 0)) +       #country label
  geom_text(aes(y = dismissals,
                label = scales::comma(dismissals)), hjust = 0, nudge_y = 3 ) +
  geom_text(aes(x=-10,y=30, label=paste0(Year)), size=16, color = 'gray45') +labs(title = 'Top 10 Bowlers' ,
                                                                                 subtitle = 'For years 2008-2016',
                                                                                 caption = 'IPL dataset ',
                                                                                 x = '',
                                                                                 y = '')+
  
  theme_minimal() +
  theme(legend.position = "none",axis.title = element_blank()) +theme(plot.title = element_text(size = 50, face = "bold", hjust = 0.5))+
  # animate along Year
  transition_states(Year,4,2) +
  ease_aes("cubic-in-out")

gganimate::animate(p32, fps = 25, duration = 16 , width = 800, height = 600, renderer = gifski_renderer("anim1.gif"))
  
