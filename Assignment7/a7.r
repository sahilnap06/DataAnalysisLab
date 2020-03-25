# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes

# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

#load the text
text <- readLines(file.choose())

#Load the data as a corpus
docs <- Corpus(VectorSource(text))

#Inspect the content of the document
inspect(docs)

#Text transformation
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))

doc_ids <- c(1)
df <- data.frame(doc_id = doc_ids, text = text, stringsAsFactors = FALSE)
df_corpus <- Corpus(DataframeSource(df))
inspect(df_corpus)
df_corpus <- tm_map(df_corpus, toSpace, "/")
inspect(df_corpus)
df_corpus <- tm_map(df_corpus, toSpace, "@")
inspect(df_corpus)
df_corpus <- tm_map(df_corpus, toSpace, "\\|")
inspect(df_corpus)

docs <- df_corpus
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)

#Build a term-document matrix
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

#Generate the Word cloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=TRUE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

#Plot word frequencies
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
