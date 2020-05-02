## over 1 
over.1 <- a %>% 
  filter(over == 1 ) %>%
  summarise(total_over_1 = n()/6)
runs.in.1 <- a %>% 
  group_by(over) %>% 
  filter(over == 1 ) %>% 
  summarise(runs.1=sum( total_runs))

first.five.avg.runs = runs.in.1

first.five.avg.runs$avg.runs.in.1 = runs.in.1$runs.1/over.1$total_over_1


######## over 2
over.2 <- a %>% 
  filter(over == 2 ) %>%
  summarise(total_over_2 = n()/6)
runs.in.2 <- a %>% 
  group_by(over) %>% 
  filter(over == 2 ) %>% 
  summarise(runs.2=sum( total_runs))

first.five.avg.runs$avg.runs.in.2 = runs.in.2$runs.2/over.2$total_over_2

### over 3

over.3 <- a %>% 
  filter(over == 3 ) %>%
  summarise(total_over_3 = n()/6)
runs.in.3 <- a %>% 
  group_by(over) %>% 
  filter(over == 3 ) %>% 
  summarise(runs.3=sum( total_runs))


first.five.avg.runs$avg.runs.in.3 = runs.in.3$runs.3/over.3$total_over_3


### over 4

over.4 <- a %>% 
  filter(over == 4 ) %>%
  summarise(total_over_4 = n()/6)
runs.in.4 <- a %>% 
  group_by(over) %>% 
  filter(over == 4 ) %>% 
  summarise(runs.4=sum( total_runs))


first.five.avg.runs$avg.runs.in.4 = runs.in.4$runs.4/over.4$total_over_4


### over 5

over.5 <- a %>% 
  filter(over == 5 ) %>%
  summarise(total_over_5 = n()/6)
runs.in.5 <- a %>% 
  group_by(over) %>% 
  filter(over == 5 ) %>% 
  summarise(runs.5=sum( total_runs))


first.five.avg.runs$avg.runs.in.5 = runs.in.5$runs.5/over.5$total_over_5


new.first.five.avg= gather(first.five.avg.runs,overs,economy.avg,-c(1:2))

new.first.five.avg = new.first.five.avg[,3:4]

names(new.first.five.avg)[names(new.first.five.avg) == "economy.avg"] <- "economy.avg1_5"


################ middle overs 


### over 6

over.6 <- a %>% 
  filter(over == 6 ) %>%
  summarise(total_over_6 = n()/6)
runs.in.6 <- a %>% 
  group_by(over) %>% 
  filter(over == 6 ) %>% 
  summarise(runs.6=sum( total_runs))

middle.avg.runs = runs.in.6
middle.avg.runs$avg.runs.in.6 = runs.in.6$runs.6/over.6$total_over_6


### over 7

over.7 <- a %>% 
  filter(over == 7 ) %>%
  summarise(total_over_7 = n()/6)
runs.in.7 <- a %>% 
  group_by(over) %>% 
  filter(over == 7 ) %>% 
  summarise(runs.7=sum( total_runs))

middle.avg.runs$avg.runs.in.7 = runs.in.7$runs.7/over.7$total_over_7


### over 8

over.8 <- a %>% 
  filter(over == 8 ) %>%
  summarise(total_over_8 = n()/6)
runs.in.8 <- a %>% 
  group_by(over) %>% 
  filter(over == 8 ) %>% 
  summarise(runs.8=sum( total_runs))

middle.avg.runs$avg.runs.in.8 = runs.in.8$runs.8/over.8$total_over_8


### over 9

over.9 <- a %>% 
  filter(over == 9 ) %>%
  summarise(total_over_9 = n()/6)
runs.in.9 <- a %>% 
  group_by(over) %>% 
  filter(over == 9 ) %>% 
  summarise(runs.9=sum( total_runs))

middle.avg.runs$avg.runs.in.9 = runs.in.9$runs.9/over.9$total_over_9


### over 10

over.10 <- a %>% 
  filter(over == 10 ) %>%
  summarise(total_over_10 = n()/6)
runs.in.10 <- a %>% 
  group_by(over) %>% 
  filter(over == 10 ) %>% 
  summarise(runs.10=sum( total_runs))

middle.avg.runs$avg.runs.in.10 = runs.in.10$runs.10/over.10$total_over_10

### over 11

over.11 <- a %>% 
  filter(over == 11 ) %>%
  summarise(total_over_11 = n()/6)
runs.in.11 <- a %>% 
  group_by(over) %>% 
  filter(over == 11 ) %>% 
  summarise(runs.11=sum( total_runs))

middle.avg.runs$avg.runs.in.11 = runs.in.11$runs.11/over.11$total_over_11

### over 12

over.12 <- a %>% 
  filter(over == 12 ) %>%
  summarise(total_over_12 = n()/6)
runs.in.12 <- a %>% 
  group_by(over) %>% 
  filter(over == 12 ) %>% 
  summarise(runs.12=sum( total_runs))

middle.avg.runs$avg.runs.in.12 = runs.in.12$runs.12/over.12$total_over_12


### over 13

over.13 <- a %>% 
  filter(over == 13 ) %>%
  summarise(total_over_13 = n()/6)
runs.in.13 <- a %>% 
  group_by(over) %>% 
  filter(over == 13 ) %>% 
  summarise(runs.13=sum( total_runs))

middle.avg.runs$avg.runs.in.13 = runs.in.13$runs.13/over.13$total_over_13


### over 14

over.14 <- a %>% 
  filter(over == 14 ) %>%
  summarise(total_over_14 = n()/6)
runs.in.14 <- a %>% 
  group_by(over) %>% 
  filter(over == 14 ) %>% 
  summarise(runs.14=sum( total_runs))

middle.avg.runs$avg.runs.in.14 = runs.in.14$runs.14/over.14$total_over_14


### over 15

over.15 <- a %>% 
  filter(over == 15 ) %>%
  summarise(total_over_15 = n()/6)
runs.in.15 <- a %>% 
  group_by(over) %>% 
  filter(over == 15 ) %>% 
  summarise(runs.15=sum( total_runs))

middle.avg.runs$avg.runs.in.15 = runs.in.15$runs.15/over.15$total_over_15




new.middle.avg= gather(middle.avg.runs,overs,economy.avg,-c(1:2))

new.middle.avg = new.middle.avg[,3:4]

rm(latest.middle.avg)
latest.middle.avg <- data.frame(c(1,2,3,4,5))
latest.middle.avg$overs <- new.first.five.avg$overs
x1 <- (new.middle.avg[1,2]+new.middle.avg[2,2])/2
x2 <- (new.middle.avg[3,2]+new.middle.avg[4,2])/2
x3 <- (new.middle.avg[5,2]+new.middle.avg[6,2])/2
x4 <- (new.middle.avg[7,2]+new.middle.avg[8,2])/2
x5 <- (new.middle.avg[9,2]+new.middle.avg[10,2])/2
latest.middle.avg$economy.avg <- as.character(c(x1,x2,x3,x4,x5))
latest.middle.avg <- latest.middle.avg[,2:3]

names(latest.middle.avg)[names(latest.middle.avg) == "economy.avg"] <- "economy.avg5_15"

############ avg runs in last 5 overs 

### over 16

over.16 <- a %>% 
  filter(over == 16 ) %>%
  summarise(total_over_16 = n()/6)
runs.in.16 <- a %>% 
  group_by(over) %>% 
  filter(over == 16 ) %>% 
  summarise(runs.16=sum( total_runs))

last.5.avg.runs= runs.in.16

last.5.avg.runs$avg.runs.in.16 = runs.in.16$runs.16/over.16$total_over_16


######## over 17
over.17 <- a %>% 
  filter(over == 17 ) %>%
  summarise(total_over_17 = n()/6)
runs.in.17 <- a %>% 
  group_by(over) %>% 
  filter(over == 17 ) %>% 
  summarise(runs.17=sum( total_runs))


last.5.avg.runs$avg.runs.in.17 = runs.in.17$runs.17/over.17$total_over_17

######## over 18
over.18 <- a %>% 
  filter(over == 18 ) %>%
  summarise(total_over_18 = n()/6)
runs.in.18 <- a %>% 
  group_by(over) %>% 
  filter(over == 18 ) %>% 
  summarise(runs.18=sum( total_runs))


last.5.avg.runs$avg.runs.in.18 = runs.in.18$runs.18/over.18$total_over_18



######## over 19
over.19 <- a %>% 
  filter(over == 19 ) %>%
  summarise(total_over_19 = n()/6)
runs.in.19 <- a %>% 
  group_by(over) %>% 
  filter(over == 19 ) %>% 
  summarise(runs.19=sum( total_runs))


last.5.avg.runs$avg.runs.in.19 = runs.in.19$runs.19/over.19$total_over_19


######## over 20
over.20 <- a %>% 
  filter(over == 20 ) %>%
  summarise(total_over_20 = n()/6)
runs.in.20 <- a %>% 
  group_by(over) %>% 
  filter(over == 20 ) %>% 
  summarise(runs.20=sum( total_runs))


last.5.avg.runs$avg.runs.in.20 = runs.in.20$runs.20/over.20$total_over_20


new.last.5.avg.runs= gather(last.5.avg.runs,overs,economy.avg,-c(1:2))

new.last.5.avg.runs = new.last.5.avg.runs[,3:4]

names(new.last.5.avg.runs)[names(new.last.5.avg.runs) == "economy.avg"] <- "economy.avg15_20"

rm(avg.runs)
avg.runs <- new.first.five.avg
avg.runs$economy.avg5_15 <- as.character(c(x1,x2,x3,x4,x5))
avg.runs$economy.avg15_20 <- new.last.5.avg.runs$`economy.avg15_20`

###################################################

p4 <- plot_ly(avg.runs, x = ~overs, y = ~economy.avg1_5,name = 'First 5 Overs', type = 'scatter', mode = 'lines+markers') %>%
  add_trace(y = ~economy.avg5_15, name = 'Middle Overs', mode = 'lines+markers') %>%
  add_trace(y = ~economy.avg15_20, name = 'Last 5 Overs', mode = 'lines+markers') %>%
  layout(title = "Distribution of Runs",
         xaxis = list(title = "Average runs per over"),
         yaxis = list (title = "Run Rate"))

p4

