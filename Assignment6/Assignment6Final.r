# Roll no. 33140
# Batch: L9
# P.S.: Application of Linear regression on Heart disease dataset to predict the fate (prob. of heart disease)

# Set working directory
setwd("G:/College/SL6/Assignment6/")

# install.packages(c("caret", "e1071"))

# Read the CSV file and analyse
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

# Plot Fate vs gender
mosaicplot(hdata$sex ~ hdata$num,main="Fate by Gender",
           shade=FALSE,color=TRUE,xlab="Gender", ylab="Heart disease")

# Plot Fate vs Age
mosaicplot(hdata$age ~ hdata$num,main="Fate by Age",
           shade=FALSE,color=TRUE,xlab="Age", ylab="Heart disease")


# Most important step, change the values of NA
levels(hdata$thal)[levels(hdata$thal)=="?"]<-"3.0"

# removal of additional NA
hdata$thal
table(hdata$thal)
# hdata$thal[is.na(hdata$thal)]<-'3.0'


table(hdata$ca)

library(caTools) # import library caTools
n<- sapply(hdata[, c(1)], mean) # get the average values
set.seed(123) # generate a pseudo-random number

v3 <- hdata[c(11:14),c(2,7:9)]
v3
m<- sapply(v3,max)
m

set.seed(121)

# Divide the dataset into 2/3 for training, and 1/3 for testing
split = sample.split(hdata$num, SplitRatio = 2/3)
train_hdata = subset(hdata, split == TRUE)
test_hdata = subset(hdata, split == FALSE)

# Apply linear regression for Fate vs age
regressor=lm(formula = num~age, data=train_hdata)

View(regressor)
regressor
# Apply regression on test data
hd_age_predict = predict(regressor, newdata=test_hdata)
hd_age_predict

# Round the values of fate in prediction
round_age=hd_age_predict
r=round(round_age)
View(r)
r
table(r,test_hdata$num)

library(e1071)
library(caret)
typeof(r)

levels(r)
levels(test_hdata$num)

str(r)
r1 = as.data.frame(r)
r1
df1=confusionMatrix(as.factor(r1$r),as.factor(test_hdata$num))
df1
