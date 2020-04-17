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

#Inspect the content of the document
inspect(docs)

docs <- docs
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower)) # convert them to lower alphabets
docs <- tm_map(docs, removeWords, stopwords("english")) # remove english stopwords

dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

set.seed(1234) # for reproducibility 
wordcloud(words = df$word, freq = df$freq, min.freq = 1,max.words=200, random.order=FALSE, rot.per=0.35,colors=brewer.pal(8, "Dark2"))

