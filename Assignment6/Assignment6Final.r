# Set working directory
setwd("G:/College/SL6/Assignment6/")
#install.packages(c("caret", "e1071"))
# Read the CSV file
hdata <- read.csv("../../Sl-VI DataSets/HeartDisease/Cleavland.csv",header=TRUE,sep=",")
names(hdata)
str(hdata)
dim(hdata)

# Change the headers
names(hdata)[1] <- "age"
names(hdata)[2] <- "sex"
names(hdata)[3] <- "cp"
names(hdata)[4] <- "trestbps"
names(hdata)[5] <- "chol"
names(hdata)[6] <- "fbs"
names(hdata)[7] <- "restecg"
names(hdata)[8] <- "thalach"
names(hdata)[9] <- "exang"
names(hdata)[10] <- "oldpeak"
names(hdata)[11] <- "slope"
names(hdata)[12] <- "ca"
names(hdata)[13] <- "thal"
names(hdata)[14] <- "num"

hdata$ca
levels(hdata$ca)[levels(hdata$ca) == "?"]<-"0.0"
hdata
hdata$ca[hdata$ca == 1.0]
typeof(hdata$ca)
nrow(hdata)

# Plotting Fate vs number of records
hdata$num[hdata$num >= 1] <- 1 # Edit the fate to 0 and 1
barplot(table(hdata$num), main="Fate", col="black")


mosaicplot(hdata$sex ~ hdata$num,main="Fate by Gender",
           shade=FALSE,color=TRUE,xlab="Gender", ylab="Heart disease")


# Most important step
levels(hdata$thal)[levels(hdata$thal)=="?"]<-"3.0"

hdata$thal
table(hdata$thal)

hdata$thal[is.na(hdata$thal)]<-'3.0'
table(hdata$ca)
library(caTools)
n<- sapply(hdata[, c(1)], mean)
set.seed(123)

v3 <- hdata[c(11:14),c(2,7:9)]
View(v3)
m<- sapply(v3,max)
m

set.seed(121)

split = sample.split(hdata$num, SplitRatio = 2/3)
train_hdata = subset(hdata, split == TRUE)
test_hdata = subset(hdata, split == FALSE)

library(caTools)
regressor=lm(formula = num~age, data=train_hdata)

View(regressor)

hd_age_predict=predict(regressor, newdata=test_hdata)
hd_age_predict
round_age=hd_age_predict
rage=round(round_age)
View(rage)
table(rage,test_hdata$num)

library(e1071)
library(caret)
typeof(rage)

levels(rage)
levels(test_hdata$num)

str(rage)
r1 = as.data.frame(rage)
r1
df1=confusionMatrix(as.factor(r1$rage),as.factor(test_hdata$num))
df1