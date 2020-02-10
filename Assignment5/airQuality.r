setwd("/home/pict/Documents/SL-VI/33140/")
airQual = read.csv(file = "~/Sl-VI DataSets/AirQualityUCI.csv",header = T,sep = ",")
summary(airQual)
str(airQual)
summary(x1)
x1 <- airQual[1:2400,]
x2 <- airQual[2401:4800,]
x3 <- airQual[4801:7200,]
x4 <- airQual[7201:9357,]
summary(airQual$CO.GT.)
subset1 = airQual[1:500,]
boxplot(subset1$CO.GT.)
subset2 <- airQual[1:100,]
boxplot(subset2$CO.GT.)

# count the number of rows with value -200 in the data frame
airQual[,c(3)] <- sapply(airQual[,c(3)], as.numeric)
as.data.frame(table(airQual$CO.GT.)) #this works as MapReduce

# Find average value of non -200 rows (CO.GT) 
subsetn <- airQual[ which(airQual$CO.GT. > -200),]
summary(subsetn$CO.GT.)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.000   1.000   1.000   1.701   2.000  11.000 