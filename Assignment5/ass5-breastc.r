##R - breastcancer
read.csv("/home/pict/SL-VI/Sl-VI DataSets/BreastCancer/BreastCancerWc.csv")

df=read.csv("/home/pict/SL-VI/Sl-VI DataSets/BreastCancer/BreastCancerWc.csv",header = FALSE,sep = ',')

##Count no of records
print(nrow(df))

##Put headers
names(df)<- c("code","clump","cell size","cell shape","adhesion","single cell size","bare nuclei","bland chromatin","normal nucleoli","mitoses","class")

##Gives datatype of each column
str(df)

##For min,max,mean,mode,median
summary(df)

##subsets acc to rows
subs1=df[1:350,]

##subsets acc to cols
subs2=df[1:6]
  
boxplot(df$clump)