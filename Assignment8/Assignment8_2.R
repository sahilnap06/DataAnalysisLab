
#RollNo: 33140
#Problem Statement: Visualize the data using R/Python.

wd = getwd()
setwd(wd)

iris=read.csv("../../Sl-VI DataSets/Iris/Iris.csv",header = F, sep = ',')
head(iris)

names(iris) <- c('Sepal.Length',"Sepal.Width","Petal.Length","Petal.Width","Class")

plot(iris$Petal.Length)

#BAR CHARTS

barplot(c(30,46,14),ylab = c("setosa","versicolor","virginica"),xlab = yaxis , main = "species quantity" )

barplot(c(30,46,14), main = "species quantity",names.arg = c("setosa","versicolor","virginica") )

barplot(iris$Sepal.Length, main = "sepal length of iris" )

hist(iris$Sepal.Length,main = "sepal length of iris",col="darkmagenta",freq=FALSE)


#PIE CHART
x<-c(25,30,45)
label<-c("setosa","versicolor","virginica")
radius<-40
color<-c("orange","brown","pink")
pie(x,label,40,main = "Specis of iris flower",col = color,clockwise = FALSE)
y<-c(summary(iris$Species))
color<-c("orange","blue","pink")


#scatterplot
plot(iris$Petal.Length,iris$Petal.Width,main = "Iris Petals Analysis",xlab = "Length",ylab = "Width",xlim = c(0,8),ylim = c(0,2.5),axes = TRUE,col=1)


