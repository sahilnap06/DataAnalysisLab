getwd()
setwd("/home/pict/Documents/SL-VI/33140/")
dataFrame1 = read.csv("/home/pict/Sl-VI DataSets/BreastCancer/BreastCancerWc.csv",header = FALSE,sep = ",")
str(dataFrame1)
summary(dataFrame1)
subset1 = dataFrame1[1:100,]