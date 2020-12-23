library(tidyverse)

batted <- read.csv("BattedBalls2020.csv")

# rename columns to make it more readable
names(batted)[1] <- "Name"
names(batted)[9] <- "HardHit%"
names(batted)[19] <- "O.Contact%"
names(batted)[20] <- "Z.Contact%"
batted <- batted[,-c(1:3,8,21)] # remove HardHit and other unnecessary variables

# Since statcast was a recent invention, we remove all NA rows
batted <- batted %>% 
  na.omit(batted) 

# Convert factor columns into numeric
for(i in 5:ncol(batted)){
  batted[,i] <- as.numeric(sub("%",
                               "",
                               batted[,i],
                               fixed = F))/100
}
