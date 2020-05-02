install.packages("plotly")
install.packages("tidyverse")

library("dplyr")
library("ggplot2")
library("plotly")
library("tidyverse")


a <- matches %>%
  filter(toss_decision == "field" | toss_decision == "bat") %>%
  select(toss_decision) %>%
  group_by(toss_decision) %>%
  summarise(total = n())

str(matches)

c<- 


c <- ggplot(a, aes(x="", y=total, fill=toss_decision)) + geom_bar(width = 1, stat = "identity")
c

pie <- c + coord_polar("y", start = 0) + geom_label(aes(label = total))
pie


a1 <- matches %>%
  filter(toss_winner == winner) %>% 
  summarise(total = n())


x1 <- as.numeric(nrow(matches)) - as.numeric(a1$total[1])


a1$instance <- c("Match.Win")

a1 <- rbind(a1,c(x1,"Match.Lost"))

b1 <- ggplot(a1, aes(x="", y=total, fill=instance)) + geom_bar(width = 1, stat = "identity")
pie1 <- b1 + coord_polar("y", start = 0) 
pie1

a2 <- matches %>%
  filter(toss_winner == winner & toss_decision == "field") %>%
  summarise(total = n())

a2$instance <- ("Won.by.chasing")
x2 <- as.numeric(a1$total[1]) - as.numeric(a2$total)

a2 <- rbind(a2, c(x2, "Won.by.batting"))

b2 <- ggplot(a2, aes(x="", y=total, fill=instance)) + geom_bar(width = 1, stat = "identity")
pie2 <- b2 + coord_polar("y", start = 0) 
pie2


p <- plot_ly() %>%
  add_pie(data = a, labels = ~toss_decision, values = ~total,
          name = 'Choice', domain = list(x = c(0, 0.4), y = c(0.4, 1)),
          textposition = 'inside',
          textinfo = 'label+percent',
          insidetextfont = list(color = '#FFFFFF'),
          hoverinfo = 'text',
          text = ~paste('$', ~toss_decision, ' billions'),
          marker = list(colors = colors,
                        line = list(color = '#FFFFFF', width = 1))) %>%
  add_pie(data = a1, labels = ~instance, values = ~total,
          name = 'Win', domain = list(x = c(0.6, 1), y = c(0.4, 1)),
          textposition = 'inside',
          textinfo = 'label+percent',
          insidetextfont = list(color = '#FFFFFF'),
          hoverinfo = 'text',
          text = ~paste('$', ~instance, ' billions'),
          marker = list(colors = colors,
                        line = list(color = '#FFFFFF', width = 1))) %>%
  add_pie(data = a2, labels = ~instance, values = ~total,
          name ='Win_by_choice', domain = list(x = c(0.25, 0.75), y = c(0, 0.6)),
          textposition = 'inside',
          textinfo = 'label+percent',
          insidetextfont = list(color = '#FFFFFF'),
          hoverinfo = 'text',
          text = ~paste('$', ~instance, ' billions'),
          marker = list(colors = colors,
                        line = list(color = '#FFFFFF', width = 1))) %>%
  layout(title = "Impact of Toss", showlegend = F,
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p

