

matches<- read.csv("matches.csv")

### top 4 teams with most wins 
pp1 <- matches %>% 
  group_by(winner) %>% 
  summarise(no.of.matches.won = n()) %>% 
  arrange(desc(no.of.matches.won)) %>% 
  top_n(4)

### top 4 teams with wins across years 
pp11 <- matches %>% 
  group_by(winner ,season) %>% 
  filter( winner == "Mumbai Indians" | winner == "Chennai Super Kings" |winner == "Kolkata Knight Riders" |winner == "Royal Challengers Bangalore") %>% 
  summarise(no.of.matches.won = n())  


pp111<- spread(pp11,winner,no.of.matches.won )

pk12 <-  plot_ly(pp111, x = ~season, y = ~`Chennai Super Kings`, name = 'Chennai Super Kings', type = 'scatter', mode = 'lines+markers') %>%
  add_trace(y = ~`Kolkata Knight Riders`, name = 'Kolkata Knight Riders', mode = 'lines+markers') %>% 
  add_trace(y = ~`Mumbai Indians`, name = 'Mumbai Indians', mode = 'lines+markers') %>% 
  layout(title = "Top 3 team Performance across 10 years",
         xaxis = list(title = "Seasons"),
         yaxis = list (title = "Top 3 team"))


pk12

