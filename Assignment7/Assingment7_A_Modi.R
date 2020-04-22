# Roll no. 33140
# Batch: L9
# Assignment 7: Generate wordcloud (1)
setwd("G:/College/SL6/Assignment7/")
# Install
#install.packages("tm")  # for text mining
#install.packages("SnowballC") # for text stemming
#install.packages("wordcloud") # word-cloud generator 
#install.packages("RColorBrewer") # color palettes
#install.packages("wordcloud2") # word-cloud generator 
#install.packages('readtext')
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("wordcloud2")
library("readtext")

#load the text

text <- readtext("../../Sl-VI DataSets/TextMining/NarendraModi.txt")

#Load the data as a corpus
docs <- Corpus(VectorSource(text))

#Inspect part of the content of the document
inspect(docs)

  # Remove White spaces
  text_data <- tm_map(docs,stripWhitespace)
  inspect(text_data)
  
  # convert to lower
  text_data <- tm_map(text_data,tolower)
  inspect(text_data)
  
  # Remove numbers
  text_data <- tm_map(text_data,removeNumbers)
  inspect(text_data)
  
  # Remove punctuations
  text_data <- tm_map(text_data,removePunctuation)
  inspect(text_data)
  
  # Remove words
  text_data <- tm_map(text_data,removeWords,stopwords('english'))
  inspect(text_data)
  

  # Create a TDM
dtm <- TermDocumentMatrix(text_data) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)
str(df)

set.seed(1234) # for reproducibility 
wordcloud(words = df$word, freq = df$freq, min.freq = 1,max.words=15, random.order=FALSE, rot.per=0.35,colors=brewer.pal(8, "Dark2"))
