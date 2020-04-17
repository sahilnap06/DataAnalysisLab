# Roll no 33140
# Assignment 8(A): Visualization of Air Quality dataset
wd = getwd()
setwd(wd)

dataset <- read.csv2("G:/College/Sl-VI DataSets/AirQualityUCI.csv", header = T, sep =',')
names(dataset)
View(dataset)
head(dataset)

names(dataset)[13] <- 'Temp'
    #BASIC PLOTS

# Generic Plots
help(plot)
plot(dataset$NMHC.GT.,dataset$Time,main = "Concentration of different times of day",
     xlab = "NMHC concentration", ylab = "Time of day", type = "h") # Histogram type

plot(dataset$C6H6.GT.,dataset$Date,main = "Concentration vs dates",
     xlab = "C6H6 Concentration", ylab = "Date",type = "p") # Point type graph

# Strip Charts
# 1. for CO.GT. 
help(stripchart)
dataset$CO.GT. <- replace(dataset$CO.GT.,dataset$CO.GT. == -200,NA)
summary(dataset$CO.GT.)
dataset$CO.GT. <- replace(dataset$CO.GT.,is.na(dataset$CO.GT.),1) # replace with the median value
stripchart(dataset$CO.GT.)

# 2. for NOX.GT.

dataset$NOx.GT. <- replace(dataset$NOx.GT.,dataset$NOx.GT. == -200.0,NA)
summary(dataset$NOx.GT.)
dataset$NOx.GT. <- replace(dataset$NOx.GT.,is.na(dataset$NOx.GT.),6) # replace with median value
stripchart(dataset$NOx.GT.)

#Dotcharts
dotchart(t(dataset$CO.GT.))

#Boxplot
dataset$NMHC.GT. <- replace(dataset$NMHC.GT.,dataset$NMHC.GT. == -200.0,NA)
summary(dataset$NMHC.GT.)
dataset$NMHC.GT. <- replace(dataset$NMHC.GT.,is.na(dataset$NMHC.GT.),1067) #replace with the median value
boxplot(dataset$NMHC.GT.)

#Scatter Plots
dataset$C6H6.GT. <- replace(dataset$C6H6.GT.,dataset$C6H6.GT. == -200,NA)
summary(dataset$C6H6.GT.)
dataset$C6H6.GT. <- replace(dataset$C6H6.GT.,is.na(dataset$C6H6.GT.),11) # replace with median value
plot(dataset$CO.GT.,dataset$C6H6.GT.,xlab = "CO.GT. concentration", ylab = "C6H6.GT.",main = "C6H6 vd CO.GT.")


#Normal QQ Plots
qqnorm(dataset$NMHC.GT., ylab = "NMHC.GT. Concentration")


# Histograms 
hist(dataset$C6H6.GT., ylab = "C6H6.GT. Concentration")

# Trying 3D Exploded Pie Chart
library(plotrix)
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries ")

yaxis=c(10,20,30,40,50,60,70,80.90,100)
summary(dataset)

barplot(dataset$Temp,main = "Temperature")
