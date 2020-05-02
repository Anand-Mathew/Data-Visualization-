library(dplyr)

a <- deliveries %>% 
    filter( dismissal_kind == "caught" |dismissal_kind == "bowled" |dismissal_kind == "run out" |dismissal_kind == "lbw" |dismissal_kind == "stumped" |dismissal_kind == "caught and bowled" | dismissal_kind == "hit wicket"   ) %>% 
    group_by(bowler) %>% 
    summarise( dismissals = n()) %>%
  arrange(desc(dismissals)) %>% 
  top_n(5)
 
a


library(ggplot2)

b <- a %>% 
  ggplot(aes (x= reorder(bowler,-dismissals), y = dismissals)) + geom_bar(stat = "identity", color = "blue", fill = "skyblue"  ) +
  geom_label(aes ( label= dismissals)) + xlab("Bowlers") + ylab("Number of Dismissals")
b

c <- deliveries %>% 
  filter( total_runs == 4 | total_runs==6 ) %>% 
  select(bowler) %>% 
  group_by(bowler) %>% 
  summarise( most_boundaries_conceded = n()) %>% 
  arrange(desc(most_boundaries_conceded)) %>% 
  top_n(5)
c
  
d <- c %>% 
  ggplot(aes (x= reorder(bowler,-most_boundaries_conceded), y = most_boundaries_conceded)) + 
  geom_bar(stat = "identity", color = "blue", fill = "skyblue" ) + geom_label(aes ( label= most_boundaries_conceded)) +
  xlab("Bowlers") + ylab("Number of Boundaries Conceded")
d



e <- deliveries %>% 
    group_by(bowler) %>% 
    summarise( no.of.balls= n()) %>% 
   mutate( no.of.overs= no.of.balls/6) %>% 
  arrange(desc(no.of.overs))

f<-  deliveries %>% 
  group_by(bowler) %>% 
  summarise( most_runs_conceded = sum(total_runs)) 

g = merge(e,f )
g$economy = g$most_runs_conceded/g$no.of.overs 
mean(g$no.of.overs)
g = filter(g, no.of.overs >= 60)
g= g[order(g$economy),] 
h = g[2:6,]


plot <- ggplot(h, aes (x= reorder(bowler,economy), y = economy)) + geom_line(linetype = "dashed") + geom_label(aes ( label= economy)) + geom_point()

summary(deliveries)
colnames(deliveries)
