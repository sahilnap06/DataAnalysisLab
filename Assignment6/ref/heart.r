heart=read.csv("/home/pict/Documents/SL-VI/33123/ass7/Cleavland.csv",header = FALSE,sep = ',')
names(heart)<-c("age","sex","cp","threstbps","chol","fbs","restecg","thalach","exang","oldpeak","slope","ca","thal","num")

boxplot(heart)

summary(heart)

str(heart)

outliers<-boxplot(heart$chol,plot=FALSE)$out
print(outliers)
heart[which(heart$chol %in% outliers),]
heart2<-heart[-which(heart$chol %in% outliers),]
boxplot(heart2$chol)

boxplot(heart2)

mean(heart$chol[which(heart$chol!="564")])
heart3<-heart
heart3<-replace(heart3$chol,heart3$chol==564,mean(heart3$chol[which(heart3$chol!="564")]))
boxplot(heart3)

barplot(table(heart$num), main="Fate", col="black")
heart$num[heart$num>0]<-1
summary(heart$num)
