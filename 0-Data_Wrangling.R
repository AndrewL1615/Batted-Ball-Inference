library(tidymodels)

batted <- read.csv("BattedBalls2020.csv")

# rename columns to make it more readable
names(batted)[1] <- "Name"
names(batted)[9] <- "HardHit%"
names(batted)[19] <- "O.Contact%"
names(batted)[20] <- "Z.Contact%"
batted <- batted[,-c(8,21)] # remove HardHit and player ID

# Since statcast was a recent invention, we remove all NA rows
batted <- batted %>% 
  na.omit(batted) 

# Convert factor columns into numeric
for(i in 8:19){
  batted[,i] <- as.numeric(sub("%",
                                   "",
                                   batted[,i],
                                   fixed = F))/100
}
