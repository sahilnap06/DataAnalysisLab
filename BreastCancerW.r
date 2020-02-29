#Working on Breast Cancer dataset 

setwd('/home/pict/Documents/SL-VI/33140/')
brc = read.csv('/home/pict/SL-VI/Sl-VI DataSets/BreastCancer/BreastCancerWc.csv',header = F,sep = ',')

names(brc)[1] <- 'ID'
names(brc)[2] <- 'CT' #Clump thickness
names(brc)[3] <- 'CellSize' 
names(brc)[4] <- 'CellShape'
names(brc)[5] <- 'MA' #Marginal Adhesion
names(brc)[6] <- 'SECS' #Single Epithelial Cell Size
names(brc)[7] <- 'BN'  #Bare Nuclei
names(brc)[8] <- 'BC'  # Bland Chromatin  
names(brc)[9] <- 'NN'  # Normal nucleoli
names(brc)[10] <- 'Mi'  #Mitoses
names(brc)[11] <- 'class' #2 is benign, 4 is malignant 

str(brc)
names(brc)
dim(brc) # dimensions of the frame, rows x Cols

#barplot class of the cancer patients (checks malignant and bening)
barplot(table(brc$class),main="cancerous",col='black')

mosaicplot(brc$class~brc$BN,main="Class by Bare Nuclei",shade=F,color=T,xlab='Class of cancer',ylab="Bare Nuclei")

boxplot(brc$BN)
#change the ? to 0
brc$BN <- factor(brc$BN)