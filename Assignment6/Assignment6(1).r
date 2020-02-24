# set working directory
setwd("/home/pict/Documents/SL-VI/33140")

# read data
hdata = read.csv(file = "/home/pict/Sl-VI DataSets/HeartDisease/Cleavland.csv",header = T,sep = ",")

# change the headers
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

# structure of hdata
str(hdata)

# dimensions of hdata (rows,columns)
dim(hdata)

# barplots narrowing of diameter as per its count
# barplot fate(i.e. hear disease 1 or not 0)
barplot(table(hdata$num), main="Fate", col="black")

# mosaic plot for sex vs fate of the patient
mosaicplot(hdata$sex ~ hdata$num,main="Fate by Gender",
           shade=FALSE,color=TRUE,xlab="Gender", ylab="Heart disease")

# making num values >= 1 to 1
hdata$num[hdata$num>0]<-1
summary(hdata$num)

# barplot fate(i.e. hear disease 1 or not 0) once again 
barplot(table(hdata$num), main="Fate", col="black")

# fate by age using boxplot
boxplot(hdata$age ~ hdata$num,main="Fate by Age",ylab="Age",xlab="Heart disease")

#replacing ? by NA
levels(hdata$thal)[levels(hdata$thal)=="?"]<-NA
table(hdata$thal)

#replacing NA with max factor
hdata$thal[is.na(hdata$thal)]<-3.0
table(hdata$thal)
