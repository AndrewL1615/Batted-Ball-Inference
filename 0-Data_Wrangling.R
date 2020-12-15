library(tidymodels)

batted <- read.csv("BattedBalls2020.csv")

# Since statcast started in 2015, we have to remove all rows with NA
batted <- batted %>% 
  na.omit(batted) 
