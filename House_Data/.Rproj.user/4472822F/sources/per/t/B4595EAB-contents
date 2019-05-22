#Reading dataset
data_X <- read.csv("data_X.csv")
data_Y <- read.csv("data_Y.csv")
data <- data.frame(data_Y,data_X)
#View(data_X)
#View(data_Y)
#View(data)

#Partitioning dataset in 70% training data and 30% testing data.
## 70% of the sample size
smp_size <- floor(0.70 * nrow(data))

## set the seed to make your partition reproductible for first classification tree
set.seed(2016103021)
train_ind_1 <- sample(seq_len(nrow(data)), size = smp_size)

#Obtaining training and test portions from Data for tree classifier No.1
data.train_1 <- data[train_ind_1, ]
data.test_1 <- data[-train_ind_1, ]
#View(data.train)
#View(data.test)

#Ploting
data.train1.tree <- rpart(as.factor(result) ~ ., data=data.train_1, control = rpart.control(cp=.05))
rpart.plot(data.train1.tree)
#summary(data.train1.tree)

#Finding misclassification value for training data No. 1
data.train.tree_1 <- tree(as.factor(result) ~ ., data=data.train_1)
summary(data.train.tree_1)
#misclass<-summary(tree.trainData_XY)
#as.matrix(misclass$misclass)[1,1]
#misclass.tree(tree.trainData_XY, detail = TRUE)

#Finding misclassification value for test data No. 1
data.test.tree_1 <- tree(as.factor(result) ~ ., data=data.test_1)
summary(data.test.tree_1)

## set the seed to make your partition reproductible for classification tree - 02
set.seed(2016103022)
train_ind_2 <- sample(seq_len(nrow(data)), size = smp_size)
data.train_2 <- data[train_ind_2, ]
data.test_2 <- data[-train_ind_2, ]
#Finding misclassification value for training data No. 2
data.train.tree_2 <- tree(as.factor(result) ~ ., data=data.train_2)
summary(data.train.tree_2)

#Finding misclassification value for test data No. 2
data.test.tree_2 <- tree(as.factor(result) ~ ., data=data.test_2)
summary(data.test.tree_2)


## set the seed to make your partition reproductible for classification tree - 03
set.seed(2016103023)
train_ind_3 <- sample(seq_len(nrow(data)), size = smp_size)
data.train_3 <- data[train_ind_3, ]
data.test_3 <- data[-train_ind_3, ]
#Finding misclassification value for training data No. 3
data.train.tree_3 <- tree(as.factor(result) ~ ., data=data.train_3)
summary(data.train.tree_3)

#Finding misclassification value for test data No. 3
data.test.tree_3 <- tree(as.factor(result) ~ ., data=data.test_3)
summary(data.test.tree_3)


## set the seed to make your partition reproductible for classification tree - 04
set.seed(2016103024)
train_ind_4 <- sample(seq_len(nrow(data)), size = smp_size)
data.train_4 <- data[train_ind_4, ]
data.test_4 <- data[-train_ind_4, ]
#Finding misclassification value for training data No. 4
data.train.tree_4 <- tree(as.factor(result) ~ ., data=data.train_4)
summary(data.train.tree_4)

#Finding misclassification value for test data No. 4
data.test.tree_4 <- tree(as.factor(result) ~ ., data=data.test_4)
summary(data.test.tree_4)


## set the seed to make your partition reproductible for classification tree - 05
set.seed(2016103025)
train_ind_5 <- sample(seq_len(nrow(data)), size = smp_size)
data.train_5 <- data[train_ind_5, ]
data.test_5 <- data[-train_ind_5, ]
#Finding misclassification value for training data No. 5
data.train.tree_5 <- tree(as.factor(result) ~ ., data=data.train_5)
summary(data.train.tree_5)

#Finding misclassification value for test data No. 5
data.test.tree_5 <- tree(as.factor(result) ~ ., data=data.test_5)
summary(data.test.tree_5)


## set the seed to make your partition reproductible for classification tree - 06
set.seed(2016103026)
train_ind_6 <- sample(seq_len(nrow(data)), size = smp_size)
data.train_6 <- data[train_ind_6, ]
data.test_6 <- data[-train_ind_6, ]
#Finding misclassification value for training data No. 6
data.train.tree_6 <- tree(as.factor(result) ~ ., data=data.train_6)
summary(data.train.tree_6)

#Finding misclassification value for test data No. 4
data.test.tree_6 <- tree(as.factor(result) ~ ., data=data.test_6)
summary(data.test.tree_6)

## set the seed to make your partition reproductible for classification tree - 07
set.seed(2016103027)
train_ind_7 <- sample(seq_len(nrow(data)), size = smp_size)
data.train_7 <- data[train_ind_7, ]
data.test_7 <- data[-train_ind_7, ]
#Finding misclassification value for training data No. 7
data.train.tree_7 <- tree(as.factor(result) ~ ., data=data.train_7)
summary(data.train.tree_7)

#Finding misclassification value for test data No. 7
data.test.tree_7 <- tree(as.factor(result) ~ ., data=data.test_7)
summary(data.test.tree_7)

## set the seed to make your partition reproductible for classification tree - 08
set.seed(2016103028)
train_ind_8 <- sample(seq_len(nrow(data)), size = smp_size)
data.train_8 <- data[train_ind_8, ]
data.test_8 <- data[-train_ind_8, ]
#Finding misclassification value for training data No. 8
data.train.tree_8 <- tree(as.factor(result) ~ ., data=data.train_8)
summary(data.train.tree_8)

#Finding misclassification value for test data No. 8
data.test.tree_8 <- tree(as.factor(result) ~ ., data=data.test_8)
summary(data.test.tree_8)


## set the seed to make your partition reproductible for classification tree - 09
set.seed(2016103029)
train_ind_9 <- sample(seq_len(nrow(data)), size = smp_size)
data.train_9 <- data[train_ind_9, ]
data.test_9 <- data[-train_ind_9, ]
#Finding misclassification value for training data No. 9
data.train.tree_9 <- tree(as.factor(result) ~ ., data=data.train_9)
summary(data.train.tree_9)

#Finding misclassification value for test data No. 9
data.test.tree_9 <- tree(as.factor(result) ~ ., data=data.test_9)
summary(data.test.tree_9)


## set the seed to make your partition reproductible for classification tree -10
set.seed(20161030210)
train_ind_10 <- sample(seq_len(nrow(data)), size = smp_size)
data.train_10 <- data[train_ind_10, ]
data.test_10 <- data[-train_ind_10, ]
#Finding misclassification value for training data No. 10
data.train.tree_10 <- tree(as.factor(result) ~ ., data=data.train_10)
summary(data.train.tree_10)

#Finding misclassification value for test data No. 10
data.test.tree_10 <- tree(as.factor(result) ~ ., data=data.test_10)
summary(data.test.tree_10)