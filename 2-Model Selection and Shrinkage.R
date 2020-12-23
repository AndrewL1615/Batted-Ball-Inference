# MLR
glmwOBA <- glm(wOBA ~ . - wRC.,
               data = batted)

# CV approach
library(boot)
set.seed(2020)
cv.errorwOBA <- cv.glm(glmfit =  glmwOBA,
                   data = batted,
                   K = 10) # 10-fold
cv.errorwOBA$delta #getting MSE for 10 fold CV

# split train/test
set.seed(2020)
battedSplit <- initial_split(batted, prop = 4/5) # 80/20 split
trainBatted <- training(battedSplit)
testBatted <- testing(battedSplit)[,-c(1:2)]



# Ridge
predwOBA <- model.matrix(wOBA ~ . - wRC., data = trainBatted)[,-1]
trainwOBA <- trainBatted$wOBA

grid <- 10^seq(10, -2, length = 100) # grid of lambda values from 10^10 to 10^-2
ridgewOBA <- glmnet(predwOBA, trainwOBA, alpha = 0, lamda = grid)

set.seed(2020)

# extracting best lambda value through CV 
cv.out <- cv.glmnet(predwOBA,trainwOBA, alpha = 0)
bestlam <- cv.out$lambda.min
bestlam

ridge.predictwOBA <- predict(ridgewOBA, s = bestlam, newx = testBatted)
mean((ridge.predictwOBA - testBatted$wOBA))

