# basic EDA
meansBatted <- colMeans(batted)

battedEV <- ggplot(stack(batted[,3:4]),
                   aes(x = ind, y = values)) + geom_boxplot()
battedPct <- ggplot(stack(batted[,5:ncol(batted)]),
                    aes(x = ind, y = values)) + geom_boxplot()
                    
# correlation matrix with response wOBA and wRC
library(corrplot)

corrwOBA <- cor(batted[,c(1,3:ncol(batted))])
corrwRC <- cor(batted[,c(2,3:ncol(batted))])

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