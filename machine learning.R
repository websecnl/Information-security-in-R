# KNN machine learing model
# install packages class
# install.packages("class")
# load packages
library(class)

# summary of the data
summary(regr)

# our data needs normalization since the values are wide spread.
# normalize function
normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}
NorRerg<- as.data.frame(lapply(regr[,3:4], normalize))
NorRerg<- cbind(NorRerg,regr$ip)

# setseed
 set.seed(1234)
 
# training and testing
ind <- sample(2, nrow(NorRerg), replace=TRUE, prob=c(0.67, 0.33))
Rerg.train<- NorRerg[ind==1,1:2]
Rerg.test<- NorRerg[ind==2,1:2]

# building the prediction lables
Rerg.trainLable<- NorRerg[ind==1,1]

# check 
print(Rerg.trainLable)

Rerg.testLable<- NorRerg[ind==2,1]
print(Rerg.testLable)

# find the k nearest neighbors of our training set
Ip.predict<- knn(train = Rerg.train, test = Rerg.test, cl = Rerg.trainLable, k=3)
# factor vector with the predicted classes for each row of the test data
Ip.predict

# checking if the model works
IpTestLabels <- data.frame(Rerg.testLable)
Combined <- data.frame(Ip.predict,Rerg.testLable)
names(Combined) <- c("Predicted ", "Observed ")


