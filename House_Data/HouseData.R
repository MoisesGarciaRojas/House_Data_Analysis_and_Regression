#Reading dataset
dataset <- read.csv("kc_house_data.csv")
houseData <- subset(dataset, select = c("price","bedrooms","bathrooms","sqft_living","sqft_lot","floors","waterfront","view","condition","grade","sqft_above","sqft_basement","yr_built","yr_renovated","zipcode","lat","long","sqft_living15","sqft_lot15"))

# Point number 1
summary(houseData$price)
sd(houseData$price)

# Point number 2
# Partitioning dataset in 80% training data and 20% testing data.
# 80% of the sample size
smp_size <- floor(0.80 * nrow(houseData))

## set the seed to make your partition reproductible
set.seed(20161101)
train_sample <- sample(seq_len(nrow(houseData)), size = smp_size)

#Obtaining training and test portions from house data
house.Train <- houseData[train_sample, ]
house.Test <- houseData[-train_sample, ]

# 2.a cases in training data set
nrow(house.Train)
# 2.b cases in test data set
nrow(house.Test)

# 2.c
  # Summary for Training set
summary(house.Train$price)
sd(house.Train$price)
  # Summary for Test set
summary(house.Test$price)
sd(house.Test$price)

# 2.d
  # Fitting a multiple linear regression model
hPrice.Tr.lm <- lm(price~., data=house.Train)
summary(hPrice.Tr.lm)
#anova(house.Train.lm)

# 2.e
  # Use the automatic forward/backward selection method to derive the \best" model
hPrice.null <- lm(price~ 1, data=house.Train) 
housing.best <- stepAIC(hPrice.null, scope=list(upper=hPrice.Tr.lm,lower=hPrice.null),direction="both")
summary(housing.best)

# 2.f
  # Draw scatterplots of the residuals in the \best" model against each of the predictors.
par(mfrow=c(3,3))
crPlots(housing.best, line = TRUE, smooth = TRUE)

# 2.g
#---------------------------------------------------
# Selected predictors with non-linear effects
# sqft_living, bathrooms, sqft_above
#---------------------------------------------------

#Calculate time for CV task to put a delay and wait for this task to complete (in nested for loops). 
start.time <- Sys.time()
lm.Highest.Ply <- lm(price ~. - floors - sqft_basement + poly(sqft_living, 5) + poly(bathrooms, 5) + poly(sqft_above, 5), data=houseData)
cv.Highest.Ply <- cv.lm(houseData, lm.Highest.Ply, m = 5, plotit = FALSE)
MSE.p <- attr(cv.Highest.Ply, "ms")
end.time <- Sys.time()
taken.time <- (end.time - start.time) %>% round()
#taken.time
#vector to save the MSE of each CV for each Polynomial
MSE.Ply <- rep(0, 125)
folds <- 5

#---------------------------------------------------
# For loop to perform iteratively cross validation and linear models with polynomials for 
# "sqft_living","bathrooms" and "sqft_above".

for(i in 1:5){
  for(j in 1:5){
    for(k in 1:5){
      #Linear model for all the polynomials of "sqft_living", "bathrooms", "sqft_above" 
      lm.Poly <- lm(price ~. - floors - sqft_basement + poly(sqft_living, i) + poly(bathrooms, j) + poly(sqft_above, k), data=houseData)
      cv.Poly <- cv.lm(houseData, lm.Poly, m = folds, plotit = FALSE)
      #Save MSE of each polynomial for the three selected predictors for ploting (in order)
      MSE.Ply[((i-1)*25) + ((j-1)*5) + k] <- attr(cv.Poly,"ms")
      #Delay in system to allow R finishing cross validation before continuing with the next
      Sys.sleep(taken.time)
    }
  }
}

#Obtain index of minimum MSE
which.min(MSE.Ply)

#Get MSE of the CV with the minimum value
MSE.min <- MSE.Ply[which.min(MSE.Ply)]

#Print Cross-Validation results of the polynomial with the minimum MSE
lm.min.MSE <- lm(price ~. - floors - sqft_basement + poly(sqft_living, 2) + poly(bathrooms, 2) + poly(sqft_above, 1), data=houseData)
cv.min.MSE <- cv.lm(houseData, lm.Highest.Ply, m = 5, plotit = FALSE)

#Vector with MSEs of each fold for the minimum MSE of the polynomials
MSEk.31 <- c(4.27e+10, 3.8e+10, 3.41e+10, 3.93e+10, 3.27e+10)

#Calculating standard error 
SE.MSEk.31 <- sd(MSEk.31)/sqrt(folds)
SE.MSEk.31

#Plot of the MSE for all crossvalidations
Poly.list <- (1:125)
par(mfrow=c(1,1))
plot(Poly.list,MSE.Ply, type = "o", col = "chocolate1", lwd = 2, main = "5-fold CV for all possible polynomials", xlab = "Number of Polynomial", ylab = "Mean Squared Error")
abline(as.numeric(MSE.min + SE.MSEk.31), b = 0,col = "red", lwd = 2)
