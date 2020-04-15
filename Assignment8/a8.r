# Roll no 33140
# Assignment 8(A): Visualization of Air Quality dataset

install.packages("Rtools")

dataset <- read.csv2("G:/College/Sl-VI DataSets/AirQualityUCI.csv", header = T, sep =',')
View(dataset)

    #BASIC PLOTS

# Generic Plots
help(plot)
plot(dataset$NMHC.GT.,dataset$Time,main = "Concentration of different times of day",
     xlab = "NMHC concentration", ylab = "Time of day", type = "h") # Histogram type

plot(dataset$C6H6.GT.,dataset$Date,main = "Concentration vs dates",
     xlab = "C6H6 Concentration", ylab = "Date",type = "p") # Point type graph

#Strip Charts
help(stripchart)
stripchart(dataset$CO.GT.)
stripchart(dataset$NOx.GT.)

#Dotcharts
dotchart(t(dataset$CO.GT.))

#Boxplot
boxplot(dataset$NMHC.GT.)

#Scatter Plots
plot(dataset$CO.GT.,dataset$C6H6.GT.)
cor(x = dataset$CO.GT.,y = dataset$.C6H6.GT.)
plot(dataset$CO.GT.,dataset$C6H6.GT., main="CO vs C6H6", xlab="CO.GT.", ylab="C6H6.GT.")

#Normal QQ Plots
qqnorm(dataset$NMHC.GT.)


# Histograms 
hist(dataset$C6H6.GT.)

# Trying 3D Exploded Pie Chart
library(plotrix)
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries ")
