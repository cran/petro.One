## ----message=FALSE-------------------------------------------------------
library(petro.One)
library(tm)
library(tibble)

use_example(1)

p1 <- onepetro_page_to_dataframe("1000_conference.html")
p2 <- onepetro_page_to_dataframe("2000_conference.html")
p3 <- onepetro_page_to_dataframe("3000_conference.html")

nn_papers <- rbind(p1, p2, p3)
nn_papers

## ------------------------------------------------------------------------
vdocs <- VCorpus(VectorSource(nn_papers$title_data))
vdocs <- tm_map(vdocs, content_transformer(tolower))      # to lowercase
vdocs <- tm_map(vdocs, removeWords, stopwords("english")) # remove stopwords

## ------------------------------------------------------------------------
tdm <- TermDocumentMatrix(vdocs)

tdm.matrix <- as.matrix(tdm)
tdm.rs <- sort(rowSums(tdm.matrix), decreasing=TRUE)
tdm.df <- data.frame(word = names(tdm.rs), freq = tdm.rs, stringsAsFactors = FALSE)
as.tibble(tdm.df)                          # prevent long printing of dataframe

## ----warning=FALSE, message=FALSE----------------------------------------
library(wordcloud)

set.seed(1234)
wordcloud(words = tdm.df$word, freq = tdm.df$freq, min.freq = 50,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))

