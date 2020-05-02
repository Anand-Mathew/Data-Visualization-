a <- deliveries

matches<- read.csv("matches.csv")

unique(matches$winner)

a11 <- matches %>%
  select(team1)%>%
  group_by(team1) %>%
  summarise(total_matches = n())

a12 <- matches %>%
  select(team2)%>%
  group_by(team2) %>%
  summarise(total_matches = n())

a13 <- a11

a13$total_matches <- a11$total_matches + a12$total_matches


a10 <- matches %>%
  select(winner)%>%
  group_by(winner) %>%
  summarise(total_wins = n())

a10<- a10[-1,]
a13$total_wins <- a10$total_wins
a13$win_prcnt <- (a13$total_wins/a13$total_matches)*100


p1 <- plot_ly(data = a13, x = ~team1, y= ~total_matches, type = 'bar', name = 'Matches') %>%
  add_trace(y = ~total_wins, name = 'Wins') %>%
  layout(xaxis = list(title = 'Teams')) %>%
  layout(yaxis = list(title = 'Match'), barmode = 'group') %>%
  layout(title = "Matches played VS Matches Won", showlegend = T)


p1

