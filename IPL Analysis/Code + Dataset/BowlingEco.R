data1.1 <- a %>% 
  filter( dismissal_kind == "caught" |dismissal_kind == "bowled" |dismissal_kind == "run out" |dismissal_kind == "lbw" |dismissal_kind == "stumped" |dismissal_kind == "caught and bowled" | dismissal_kind == "hit wicket"   ) %>% 
  group_by(bowler) %>% 
  summarise( dismissals = n()) %>%
  arrange(desc(dismissals))
### calculating economy

data1.2<- a %>% 
  group_by(bowler) %>% 
  summarise( no.of.balls= n()) %>% 
  mutate( no.of.overs= no.of.balls/6) %>% 
  arrange(desc(no.of.overs))

data1.1<- data1.1[1:5,]

f<-  a %>% 
  group_by(bowler) %>% 
  summarise( most_runs_conceded = sum(total_runs)) 

g = merge(data1.2,f )
g$economy = g$most_runs_conceded/g$no.of.overs
g1 <- select(g, c (1,5))


g12 <- merge(data1.1, g1 , by.x ="bowler" , by.y="bowler")

g12<- arrange(g12,desc(g12$dismissals))
g12$economy <- round(g12$economy, digits = 2)


p2 <- plot_ly(g12, x = ~bowler, y = ~dismissals, type = 'bar',marker = list(color = c("green" , "red","yellow", "green","yellow"))) %>% 
  layout(title = 'Most dismissals vs economy',
         xaxis = list(title = " Players"),
         yaxis = list(title = "Dismissals"),
         barmode = 'bar',
         paper_bgcolor = 'rgba(245, 246, 249, 1)',
         plot_bgcolor = 'rgba(245, 246, 249, 1)',
         showlegend = FALSE) %>% 
  add_annotations(text = g12$economy,
                  x = g12$bowler,
                  y = g12$dismissals,
                  xref = "x",
                  yref = "y",
                  font = list(family = 'Arial',
                              size = 18,
                              color = 'black'),
                  showarrow = FALSE)
p2


