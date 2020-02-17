setwd("~/Documents/SL-VI/33140/")
clev = read.csv("~/Sl-VI DataSets/HeartDisease/Cleavland.csv",header = F, sep = ",")
# take the value to just yes or no
clev$V14[clev$V14>0] <- 1
# calculate number of the people with disease or not 
table(clev$V14)
# 0   1 
# 164 139 
# calculate the number of male vs female with disease
mosaicplot(clev$V2 ~ clev$V14,main="Fate by Gender",
           shade=FALSE,color=TRUE,xlab="Gender", ylab="Heart disease")

summary(cleaveland)
# check for outliers in V4
boxplot(clev$V4)
# we can see that it has outliers above value 170
mean(clev$V4[which(clev$V4 < 170)])
# [1] 129.6138 -> The mean of other values
clev$V4[clev$V4 > 170] <- 129.6138

# outliers in V12
View(which(clev$V12 == "?"))