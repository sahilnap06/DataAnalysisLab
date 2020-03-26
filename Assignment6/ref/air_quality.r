AirQl2=read.csv("/home/pict/Documents/SL-VI/33123/AirQualityUCI/AirQualityUCI.csv",header = FALSE,sep = ';')
str(AirQl2)

print(nrow(AirQl2))

names(AirQl2)<- c("Date","Time","CO conc","Tin","Non Metanic","Benzene","Titania","NOx","Tungsten","NO2","Tungsten oxide","Indium oxide","Temp","Humidity","AH")

str(AirQl2)

summary(AirQl2)

#omiting null columns
print(ncol(AirQl2))
subs1=AirQl2[1:15]
AirQl2=subs1

AirQl2[,c(3)]<-sapply(AirQl2[,c(3)],as.numeric)
boxplot(AirQl2$V3)

subs2=AirQl2[1:500,1:3]
boxplot(subs2$V3)

length(which(AirQl2$V3 == -200))

mean(AirQl2$V3)
