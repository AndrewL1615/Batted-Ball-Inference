# basic EDA
meansBatted <- colMeans(batted[,6:19])

battedEV <- ggplot(stack(batted[,6:7]),
                   aes(x = ind, y = values)) + geom_boxplot()
battedPct <- ggplot(stack(batted[,8:19]),
                    aes(x = ind, y = values)) + geom_boxplot()
                    
# correlation matrix with response wOBA and wRC
library(corrplot)

corrwOBA <- cor(batted[,c(4,6:19)])
corrwRC <- cor(batted[,c(5,6:19)])

corrpwOBA <- corrplot(corrwOBA,
                      type = "upper",
                      tl.col = "black",
                      tl.srt = 45,
                      tl.cex = 0.8)
     
corrpwRC <- corrplot(corrwRC,
                     type = "upper",
                     tl.col = "black",
                     tl.srt = 45,
                     tl.cex = 0.8)