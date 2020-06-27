#Load Churn Data from csv file

churnData = read.csv("Telco customer churn_pre processed data_v0.2.csv", header = TRUE)

#Split dataset into Train data and test data 80:20

set.seed(1234)
indx = sample(2, nrow(churnData), replace=TRUE, prob=c(0.8, 0.2)) #Split dataset 4/5 & 1/5
churnData.train = churnData[indx==1, 2:20] #Where sample index is 1
churnData.test = churnData[indx==2, 2:20] #Where sample index is 2
summary(churnData.train)
summary(churnData.test)

#Copy labels from churn column of the dataset for train and test dataset

churnData.trainLabels = churnData[indx==1, 21] #Copy from churn column where sample index is 1
churnData.testLabels = churnData[indx==2, 21] #Copy from churn column where sample index is 2

#Running knn algorithm


library(class) #Load library

#Running knn algorithm with multiple k values

#k=1
churnData.pred1 = knn(train = churnData.train, test = churnData.test, cl = churnData.trainLabels, k=1)
churnData.pred1

#k=3
churnData.pred3 = knn(train = churnData.train, test = churnData.test, cl = churnData.trainLabels, k=3)
churnData.pred3

#k=71
churnData.pred71 = knn(train = churnData.train, test = churnData.test, cl = churnData.trainLabels, k=71)
churnData.pred71

#k=80
churnData.pred80 = knn(train = churnData.train, test = churnData.test, cl = churnData.trainLabels, k=80)
churnData.pred80

#k=83
churnData.pred83 = knn(train = churnData.train, test = churnData.test, cl = churnData.trainLabels, k=83)
churnData.pred83

#k=85
churnData.pred85 = knn(train = churnData.train, test = churnData.test, cl = churnData.trainLabels, k=85)
churnData.pred85

#k=87
churnData.pred87 = knn(train = churnData.train, test = churnData.test, cl = churnData.trainLabels, k=87)
churnData.pred87

#k=91
churnData.pred91 = knn(train = churnData.train, test = churnData.test, cl = churnData.trainLabels, k=91)
churnData.pred91

#Cross tables for all of the above k values


library(gmodels) #Load gmodels library

CrossTable(x = churnData.testLabels, y = churnData.pred1, prop.chisq=FALSE)
CrossTable(x = churnData.testLabels, y = churnData.pred3, prop.chisq=FALSE)
CrossTable(x = churnData.testLabels, y = churnData.pred71, prop.chisq=FALSE)
CrossTable(x = churnData.testLabels, y = churnData.pred80, prop.chisq=FALSE)
CrossTable(x = churnData.testLabels, y = churnData.pred83, prop.chisq=FALSE)
CrossTable(x = churnData.testLabels, y = churnData.pred85, prop.chisq=FALSE)
CrossTable(x = churnData.testLabels, y = churnData.pred87, prop.chisq=FALSE)
CrossTable(x = churnData.testLabels, y = churnData.pred91, prop.chisq=FALSE)

