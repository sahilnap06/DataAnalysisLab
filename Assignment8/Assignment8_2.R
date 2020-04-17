# Roll no. 33140
# assignemnt 8 (B): Visualization on heart disease dataset

wd = getwd()
setwd(wd)

#install.packages( "ggplot2", repos = c("http://rstudio.org/_packages","http://cran.rstudio.com"))
install.packages('gtools')
install.packages('plotly')
# loading libraries
library('ggplot2')
library('dplyr')
library('gtools')
library('plotly')

# read the forest fire dataset
df<-read.csv2("../../Sl-VI DataSets/forestfires/forestfires.csv",sep=',',header=TRUE) # Import Dataset
View(df)
names(df)

#cleaning
summary(df$month)
levels(df$month)[levels(df$month) == 'jan'] <- 1
levels(df$month)[levels(df$month) == 'feb'] <- 2
levels(df$month)[levels(df$month) == 'mar'] <- 3
levels(df$month)[levels(df$month) == 'apr'] <- 4
levels(df$month)[levels(df$month) == 'may'] <- 5
levels(df$month)[levels(df$month) == 'jun'] <- 6
levels(df$month)[levels(df$month) == 'jul'] <- 7
levels(df$month)[levels(df$month) == 'aug'] <- 8
levels(df$month)[levels(df$month) == 'sep'] <- 9
levels(df$month)[levels(df$month) == 'oct'] <- 10
levels(df$month)[levels(df$month) == 'nov'] <- 11
levels(df$month)[levels(df$month) == 'dec'] <- 12
summary(df$month)
levels(df$day)[levels(df$day) == 'mon'] <- 1
levels(df$day)[levels(df$day) == 'tue'] <- 2
levels(df$day)[levels(df$day) == 'wed'] <- 3
levels(df$day)[levels(df$day) == 'thu'] <- 4
levels(df$day)[levels(df$day) == 'fri'] <- 5
levels(df$day)[levels(df$day) == 'sat'] <- 6
levels(df$day)[levels(df$day) == 'sun'] <- 7

df$month <- as.numeric(as.character(df$month))
df$day <- as.numeric(as.character(df$day))
df$area <- as.numeric(as.character(df$area))
typeof(df$month)
typeof(df$area)
typeof(df$day)
  #sorting the data as per months and then days
cleaned <- df[mixedorder(-df$month,df$day),]
View(cleaned)

# Visualizations
help(plot)

plot(cleaned$month,cleaned$day,type = 's', main = "Day-wise fire in months", xlab = "Months", ylab ="Days")

ggplot(cleaned, aes(x = "month", y = "day"))+geom_point()

tapply(cleaned$area, cleaned$month, FUN = sum)

plot(cleaned$month,cleaned$area, type = "o",xlab = "Months",ylab = "Area destroyed")

plot(cleaned$month,cleaned$rain,type = 'l',xlab = "Month",ylab = "Rain in cm")

