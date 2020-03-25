library(readxl)
dataset_Facebook <- read_excel("dataset_Facebook.xls")
View(dataset_Facebook)

#subsetting
v1 <- dataset_Facebook[c(10:21),c(2,6:7)]
View(v1)

v2 <- subset(dataset_Facebook,comment>15)
View(v2)

v3 <- dataset_Facebook[c(10:25),c(2,7:9)]
View(v3)

#merge data
v1 <- dataset_Facebook[c(10:12),c(2,6:7)]
v3 <- dataset_Facebook[c(11:14),c(2,7:9)]
m1 <- merge(v1,v3,by="Paid")
View(m1)

#sort data
s1 <- dataset_Facebook[order(dataset_Facebook$comment),]
View(s1)

s2 <- dataset_Facebook[order(dataset_Facebook$comment, -dataset_Facebook$share),]
View(s2)

#Transposing Data

t(v1)

#Melting Data to long format

library(reshape2)
m1 <- melt(v3, id = c("Type","Lifetime Post Total Reach"))
View(m1)
head(m1)
tail(m1)
