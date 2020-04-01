library(readxl)
dataset <- read_excel("/home/pict/33123/assign5/AirQualityUCI.xls")
View(dataset)

    #BASIC PLOTS

#Strip Charts
help(stripchart)
stripchart(dataset$`CO(GT)`)
stripchart(dataset$`NOx(GT)`)

#Line Charts
cars <- c(1, 3, 6, 4, 9)
plot(cars)
plot(cars, type="o", col="blue")
title(main="Autos", col.main="red", font.main=4)

cars <- c(1, 3, 6, 4, 9)
trucks <- c(2, 5, 4, 5, 12)
plot(cars, type="o", col="blue", ylim=c(0,12))

#Bar Charts
cars <- c(1, 3, 6, 4, 9)
barplot(cars)

#Histogram
suvs <- c(4,4,6,6,16)
hist(suvs)

#Pie Charts
cars <- c(1, 3, 6, 4, 9)
pie(cars)
pie(cars, main="Cars", col=rainbow(length(cars)),
labels=c("Mon","Tue","Wed","Thu","Fri"))

#Dotcharts
dotchart(t(dataset$`CO(GT)`))

#Boxplot
boxplot(dataset$`NMHC(GT)`)

#Scatter Plots
plot(dataset$`CO(GT)`,dataset$`C6H6(GT)`)
cor(dataset$`CO(GT)`,dataset$`C6H6(GT)`)
plot(dataset$`CO(GT)`,dataset$`C6H6(GT)`, main="CO vs C6H6", xlab="CO(GT)", ylab="C6H6(GT)")

#Normal QQ Plots
qqnorm(dataset$`NMHC(GT)`)
