#Applying SVM Classifier on Titanic dataset.
library(e1071)
library(readr)

train <- read_csv("C:/Users/user/Downloads/train.csv")
test <- read_csv("C:/Users/user/Downloads/test.csv")

train[is.na(train)]<- 0
test[is.na(test)] <- 0

str(train)
str(test)


SVMmodel <- svm(as.factor(Survived) ~ Age+SibSp+Parch+Sex+Fare, data = train, cost = 100, gamma = 1)
prediction <- predict(SVMmodel, test)

plot(prediction)
summary(prediction)

output <- data.frame(test$PassengerId, prediction)
colnames(output) = cbind("PassengerID", "Survived")
