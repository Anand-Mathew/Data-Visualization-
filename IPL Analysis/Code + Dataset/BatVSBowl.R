## heat 

library(dplyr)
a<- read.csv("deliveries2.csv")

heat1 <- a %>%
  group_by(batsman, bowler) %>% 
  summarise(runs.conceeded = sum(total_runs)) %>% 
  arrange(desc(runs.conceeded))


heat1.1 <- a %>% 
  group_by(batsman) %>% 
  summarise(runs.scored = sum(total_runs)) %>% 
  arrange(desc(runs.scored)) %>% 
  top_n(7)

data1.1 <- a %>% 
  filter( dismissal_kind == "caught" |dismissal_kind == "bowled" |dismissal_kind == "run out" |dismissal_kind == "lbw" |dismissal_kind == "stumped" |dismissal_kind == "caught and bowled" | dismissal_kind == "hit wicket"   ) %>% 
  group_by(bowler) %>% 
  summarise(dismissals = n()) %>%
  arrange(desc(dismissals)) %>% 
  top_n(7)


heat2.1 <- heat1 %>% 
  filter( batsman %in% (heat1.1$batsman) & bowler %in% (data1.1$bowler))

library(ggplot2)

ggplot(heat2.1,aes(y= heat2.1$batsman, x = heat2.1$bowler) ) + geom_tile(aes(fill=heat2.1$runs.conceeded))  +
  scale_fill_gradient(low="cyan",high="black")

kkp<- spread(heat2.1,bowler,runs.conceeded)

kkp2 <- kkp[,2:8]
rownames(kkp2)<- kkp$batsman


kkp3<-as.matrix(kkp2)
kkp4<- t(kkp3)

library(plotly)
p5 <- plot_ly(
  x = rownames(kkp2)  , y = colnames(kkp2),
  z = kkp4, type = "heatmap" ,colorscale="Viridis",reversescale =T,
  colorbar=list(
    title='Runs Scored'
    , limits = c(0,150)) ) %>% layout(title = 'Stats: Top 7 Batsmen v/s Bowlers',
                                      xaxis = list(title = 'Batsman'),
                                      yaxis = list(title = 'Bowler'))

p5

