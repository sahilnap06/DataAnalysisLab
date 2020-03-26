#getwd()
#setwd("/home/pict/Documents/SL-VI/33123")
heart_disease=read.csv("/home/pict/Documents/SL-VI/33123/Cleavland.csv",header=FALSE)
colnames(heart_disease)<-c("age","sex","cp","trestbps","chol","fbs","restecg","thalach","exang","oldpeak","slope","ca","thal","num")

str(heart_disease)
dim(heart_disease)
# dumifying variable num, if num!-0means,

heart_disease$num[heart_disease$num>0]<-1
summary(heart_disease$num)

# barplot fate(i.e. hear disease 1 or not 0)
barplot(table(heart_disease$num), main="Fate", col="black")

#plot sex vs fate using mosaicplot
mosaicplot(heart_disease$sex ~ heart_disease$num,main="Fate by Gender",
           shade=FALSE,color=TRUE,xlab="Gender", ylab="Heart disease")

#fate by age using boxplot
boxplot(heart_disease$age ~ heart_disease$num,main="Fate by Age",ylab="Age",xlab="Heart
disease")


#replacing ? by NA
levels(heart_disease$thal)[levels(heart_disease$thal)=="?"]<-NA
table(heart_disease$thal)


#replacing NA with max factor
heart_disease$thal[is.na(heart_disease$thal)]<-as.factor("3.0")


table(heart_disease$thal)


levels(heart_disease$ca)[levels(heart_disease$ca)=="?"]<-NA
table(heart_disease$ca)

heart_disease$ca[is.na(heart_disease$ca)]<-as.factor("0.0")
table(heart_disease$ca)


dim(heart_disease)


library(caTools)
heart_disease[, c(1)] <- sapply(heart_disease[, c(1)], as.numeric)
set.seed(123)

split = sample.split(heart_disease$num, SplitRatio = 2/3)
train_heart_disease = subset(heart_disease, split == TRUE)
test_heart_disease = subset(heart_disease, split == FALSE)

# train_heart_disease=heart_disease[1:212,]
# test_heart_disease=heart_disease[213:303,]
dim(train_heart_disease)
dim(test_heart_disease)


regressor=lm(formula = num~age, data=train_heart_disease)
#predicting the test set result using regressor

hd_age_predict=predict(regressor, newdata=test_heart_disease)
# As the result is not whole number, rounding the result
round_age=hd_age_predict

rage=round(round_age)

# Displaying the accuracy using confusion Matrix
library(e1071)
library(caret)
df=confusionMatrix(table(rage,test_heart_disease$num))



#naive bayes

h1data<-heart_disease
h1data$age=factor(h1data$age)
h1data$sex=factor(h1data$sex)
h1data$cp=factor(h1data$cp)
h1data$trestbps=factor(h1data$trestbps)
h1data$chol=factor(h1data$chol)
h1data$fbs=factor(h1data$fbs)
h1data$restecg=factor(h1data$restecg)
h1data$thalach=factor(h1data$thalach)
h1data$exang=factor(h1data$exang)
h1data$oldpeak=factor(h1data$oldpeak)
h1data$slope=factor(h1data$slope)
h1data$num=factor(h1data$num)


# Dividing dataset into training and testing
trainnb_hdata=h1data[1:212,]
testnb_hdata=h1data[213:303,-14]
# Applying Naive Bayes claasifier on dataset
library(e1071)
classifier <- naiveBayes(num ~age+sex+cp+trestbps+chol+fbs+restecg+thalach+exang+oldpeak+slope,trainnb_hdata)
prediction <- predict(classifier, testnb_hdata ,type="class")

# Displaying the accuracy using confusion Matrix
library(e1071)
library(caret)
df1=confusionMatrix(h1data[213:303,14],prediction)


