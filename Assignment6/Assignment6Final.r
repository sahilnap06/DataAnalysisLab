install.packages(c("caret", "e1071"))
hdata <- read.csv("heartdis.csv",header=TRUE,sep=",")
names(hdata)
str(hdata)
dim(hdata)
levels(hdata$ca)[levels(hdata$ca) == "?"]<-"0.0"
hdata
hdata$ca[hdata$ca == 1.0]
typeof(hdata$ca)
nrow(hdata)
barplot(table(hdata$num), main="Fate", col="black")
mosaicplot(hdata$sex ~ hdata$num,main="Fate by Gender",
           shade=FALSE,color=TRUE,xlab="Gender", ylab="Heart disease")
hdata$num[hdata$num>0]<-1
levels(hdata$thal)[levels(hdata$thal)=="?"]<-"3.0"
hdata$thal
table(hdata$thal)
hdata$thal[is.na(hdata$thal)]<-3
hdata$thal[is.na(hdata$thal)]<-3.0
table(hdata$ca)
library(caTools)
hdata[, c(1)] <- sapply(hdata[, c(1)], as.numeric)
set.seed(123)
split = sample.split(hdata$num, SplitRatio = 2/3)
train_hdata = subset(hdata, split == TRUE)
test_hdata = subset(hdata, split == FALSE)

library(caTools)
regressor=lm(formula = num~age, data=train_hdata)
hd_age_predict=predict(regressor, newdata=test_hdata)
hd_age_predict
round_age=hd_age_predict
rage=round(round_age)
table(rage,test_hdata$num)

library(e1071)
library(caret)
df=confusionMatrix(rage,test_hdata$num)
str(rage)
r1 = as.data.frame(rage)
r1
df=confusionMatrix(as.factor(r1$rage),as.factor(test_hdata$num))
df
#?confusionMatrix()
