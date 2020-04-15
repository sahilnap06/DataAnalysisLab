setwd("G:/College/SL6/Assignment6")

# Read the dataset
breast_cancer = read.csv2("../../Sl-VI DataSets/BreastCancer/BreastCancerWc.csv",header = T,sep =',')
names(breast_cancer)

# Set the labels
names(breast_cancer)[1] = "ID"
names(breast_cancer)[2] = "CT" # Clump thickness
names(breast_cancer)[3] = "CellSize"
names(breast_cancer)[4] = "CellShape"
names(breast_cancer)[5] = "MA" # Marginal adhesion
names(breast_cancer)[6] = "ECellSize" # Epithelial cell size
names(breast_cancer)[7] = "BN" # Bare nuclei
names(breast_cancer)[8] = "BC" # Bland chromatin
names(breast_cancer)[9] = "NN" # Normal nuclei
names(breast_cancer)[10] = "Mit" # Mitoses
names(breast_cancer)[11] = "Class" # class

names(breast_cancer)
breast_cancer$Class

# Set 1 for malignant, 0 for benign

# levels(breast_cancer$Class)[levels(breast_cancer$Class) == 4] <- 1 # DOESN'T WORK
# levels(breast_cancer$Class)[levels(breast_cancer$Class) == 2] <- 0 # DOESN'T WORK

breast_cancer$Class <- replace(breast_cancer$Class, breast_cancer$Class == 4,1)
breast_cancer$Class <- replace(breast_cancer$Class, breast_cancer$Class == 2,0)

breast_cancer$Class

# Check for missing value
'?' %in% breast_cancer$CT
'?' %in% breast_cancer$CellSize
'?' %in% breast_cancer$CellShape
'?' %in% breast_cancer$MA
'?' %in% breast_cancer$ECellSize
'?' %in% breast_cancer$BN # Returned true (16 values are '?')

breast_cancer$BN <- replace(breast_cancer$BN, breast_cancer$BN == '?',NA)

levels(breast_cancer)[levels(breast_cancer)]
summary(breast_cancer$CT)
breast_cancer$BN[is.na(breast_cancer$BN)] <- 4.0 # Median value

mosaicplot(breast_cancer$CellSize ~ breast_cancer$Class, main = "Cancer class by Cell size",
           color = TRUE, shade = FALSE, xlab = "Cell size ID", ylab = "Class of cancer")

mosaicplot(breast_cancer$CellShape ~ breast_cancer$Class, main = "Cancer class by Cell shape",
           color = TRUE, shade = FALSE, xlab = "Cell shape ID", ylab = "Class of cancer")

mosaicplot(breast_cancer$BN ~ breast_cancer$Class, main = "Cancer class as per Bare Nuclei",
           color = TRUE, shade = FALSE, xlab = "Bare Nuclei ID", ylab = "Class of cancer") # TOO RANDOM