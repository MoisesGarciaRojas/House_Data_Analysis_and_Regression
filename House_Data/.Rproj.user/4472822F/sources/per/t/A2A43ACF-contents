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
  #Creating 5-folds for crossvalidation
k.smp_size <- (nrow(houseData) - smp_size)

  #Fold k1
k1 <- house.Test
k2_sample <- sample(seq_len(nrow(house.Train)), size = k.smp_size)
 
 #Fold k2
k2 <- house.Train[k2_sample, ]
k345 <- house.Train[-k2_sample, ]
k3_sample <- sample(seq_len(nrow(k345)), size = k.smp_size)
 
 #Fold k3
k3 <- k345[k3_sample, ]
k45 <- k345[-k3_sample, ]
k4_sample <- sample(seq_len(nrow(k45)), size = k.smp_size)
  
#Fold k4
k4 <- k45[k4_sample, ]
 
 #Fold k5
k5 <- k45[-k4_sample, ]

#function to calculate MSE
mse_v <- function(testData,model){
  MSE <- mean((testData$price-predict(model,testData))^2)
  return(MSE)
}

# Linear model function for crossvalidation
f.lm.crossV <- function(formula,kf.Train1,kf.Train2,kf.Train3,kf.Train4){
  k.training <- rbind(kf.Train1,kf.Train2,kf.Train3,kf.Train4)
  l.model <- lm(formula, data=k.training)
  return(l.model)
}

#-------------------------------------------------------------------------------------sqft_living

#vector to save the MSE of each cross fold validation for each polynomial of "sqft_living"
MSE.Crsfld.sqft_living <- c(0,0,0,0,0)

#vector to save the MSE of each polynomial for "sqft_living"
MSE.Ply.sqft_living <- c(0,0,0,0,0)
#---------------------------------------------------
# For loop to perform iteratively cross validation for "sqft_living" 
# In the first loop, selection of the formula (polynomial) is achieved. In the nested
# for loop cross validation and MSE of each k-test set is obtained and saved
# in MSE.Crsfld.sqft_living vector, subsequently the mean of this variable is stored in
# MSE.Ply.sqft_living this is for each polynomial.

for(i in 1:5){
  formula.sqft_living <- lm(price ~. - floors - sqft_basement + poly(sqft_living, i), data=houseData)
  for(j in 1:5){
    if(j == 1){
      lm.sqft_living <- f.lm.crossV(formula.sqft_living, k2, k3, k4, k5)
      MSE.Crsfld.sqft_living[j] <- mse_v(k1,lm.sqft_living)
    }
    if(j == 2){
      lm.sqft_living <- f.lm.crossV(formula.sqft_living, k1, k3, k4, k5)
      MSE.Crsfld.sqft_living[j] <- mse_v(k2,lm.sqft_living)
    }
    if(j == 3){
      lm.sqft_living <- f.lm.crossV(formula.sqft_living, k1, k2, k4, k5)
      MSE.Crsfld.sqft_living[j] <- mse_v(k3,lm.sqft_living)
    }
    if(j == 4){
      lm.sqft_living <- f.lm.crossV(formula.sqft_living, k1, k2, k3, k5)
      MSE.Crsfld.sqft_living[j] <- mse_v(k4,lm.sqft_living)
    }
    if(j == 5){
      lm.sqft_living <- f.lm.crossV(formula.sqft_living, k1, k2, k3, k4)
      MSE.Crsfld.sqft_living[j] <- mse_v(k5,lm.sqft_living)
    }
  }
  MSE.Ply.sqft_living[i] <- mean(MSE.Crsfld.sqft_living)
}
#View(MSE.Ply.sqft_living)
#Vector to plot the order of the against the MSE
order <- c(1,2,3,4,5)

#Plot of the MSE for "sqft_living"
par(mfrow=c(1,1))
plot(order,MSE.Ply.sqft_living, type = "o", col = "red", lwd = 2, main = "5-fold CV - sqft_living", xlab = "Degree of Polynomial", ylab = "Mean Squared Error")

#vector to save the MSE of each cross fold validation for each polynomial of "bathrooms "
MSE.Crsfld.bathrooms <- c(0,0,0,0,0)

#vector to save the MSE of each polynomial for "bathrooms "
MSE.Ply.bathrooms <- c(0,0,0,0,0)
#---------------------------------------------------
# For loop to perform iteratively cross validation for "bathrooms" 
# In the first loop, selection of the formula (polynomial) is achieved. In the nested
# for loop cross validation and MSE of each test set is obtained and saved
# in MSE.Crsfld.bathrooms vector, subsequently the mean of this variable is stored in
# MSE.Ply.bathrooms this is for each polynomial.

for(i in 1:5){
  formula.bathrooms <- lm(price ~. - floors - sqft_basement + poly(bathrooms, i), data=houseData)
  for(j in 1:5){
    if(j == 1){
      lm.bathrooms <- f.lm.crossV(formula.bathrooms, k2, k3, k4, k5)
      MSE.Crsfld.bathrooms[j] <- mse_v(k1,lm.bathrooms)
    }
    if(j == 2){
      lm.bathrooms <- f.lm.crossV(formula.bathrooms, k1, k3, k4, k5)
      MSE.Crsfld.bathrooms[j] <- mse_v(k2,lm.bathrooms)
    }
    if(j == 3){
      lm.bathrooms <- f.lm.crossV(formula.bathrooms, k1, k2, k4, k5)
      MSE.Crsfld.bathrooms[j] <- mse_v(k3,lm.bathrooms)
    }
    if(j == 4){
      lm.bathrooms <- f.lm.crossV(formula.bathrooms, k1, k2, k3, k5)
      MSE.Crsfld.bathrooms[j] <- mse_v(k4,lm.bathrooms)
    }
    if(j == 5){
      lm.bathrooms <- f.lm.crossV(formula.bathrooms, k1, k2, k3, k4)
      MSE.Crsfld.bathrooms[j] <- mse_v(k5,lm.bathrooms)
    }
  }
  MSE.Ply.bathrooms[i] <- mean(MSE.Crsfld.bathrooms)
}
#View(MSE.Ply.bathrooms)
#Plot of the MSE for "bathrooms"
plot(order,MSE.Ply.bathrooms, type = "o", col = "chocolate1", lwd = 2, main = "5-fold CV - Bathrooms", xlab = "Degree of Polynomial", ylab = "Mean Squared Error")


#-------------------------------------------------------------------------------------sqft_above
#vector to save the MSE of each cross fold validation for each polynomial of "sqft_above"
MSE.Crsfld.sqft_above <- c(0,0,0,0,0)

#vector to save the MSE of each polynomial for "sqft_above"
MSE.Ply.sqft_above <- c(0,0,0,0,0)

#---------------------------------------------------
# For loop to perform iteratively cross validation for "sqft_above" 
# In the first loop, selection of the formula (polynomial) is achieved. In the nested
# for loop cross validation and MSE of each test set is obtained and saved
# in MSE.Crsfld.sqft_above vector, subsequently the mean of this variable is stored in
# MSE.Ply.sqft_above this is for each polynomial.

for(i in 1:5){
  formula.sqft_above <- lm(price ~. - floors - sqft_basement + poly(sqft_above, i), data=houseData)
  for(j in 1:5){
    if(j == 1){
      lm.sqft_above <- f.lm.crossV(formula.sqft_above, k2, k3, k4, k5)
      MSE.Crsfld.sqft_above[j] <- mse_v(k1,lm.sqft_above)
    }
    if(j == 2){
      lm.sqft_above <- f.lm.crossV(formula.sqft_above, k1, k3, k4, k5)
      MSE.Crsfld.sqft_above[j] <- mse_v(k2,lm.sqft_above)
    }
    if(j == 3){
      lm.sqft_above <- f.lm.crossV(formula.sqft_above, k1, k2, k4, k5)
      MSE.Crsfld.sqft_above[j] <- mse_v(k3,lm.sqft_above)
    }
    if(j == 4){
      lm.sqft_above <- f.lm.crossV(formula.sqft_above, k1, k2, k3, k5)
      MSE.Crsfld.sqft_above[j] <- mse_v(k4,lm.sqft_above)
    }
    if(j == 5){
      lm.sqft_above <- f.lm.crossV(formula.sqft_above, k1, k2, k3, k4)
      MSE.Crsfld.sqft_above[j] <- mse_v(k5,lm.sqft_above)
    }
  }
  MSE.Ply.sqft_above[i] <- mean(MSE.Crsfld.sqft_above)
}
#View(MSE.Ply.sqft_above)
#Plot of the MSE for "sqft_above"
plot(order,MSE.Ply.sqft_above, type = "o",  col = "forestgreen", lwd = 2, main = "5-fold CV - sqft_above", xlab = "Degree of Polynomial", ylab = "Mean Squared Error")



