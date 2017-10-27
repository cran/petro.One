## ------------------------------------------------------------------------
library(petro.One)
library(tm)

my_url <- make_search_url(query = "Permanent Downhole Gauge", 
                          how = "all")        

get_papers_count(my_url)    # how many papers total
papers_by_type(my_url)      # papers by type

# create a dataframe of papers found
df <- read_multidoc(my_url)
df

## ------------------------------------------------------------------------
library(petro.One)

term_freq <- term_frequency(df)
term_freq

## ----fig.height=9, fig.width=6-------------------------------------------
library(petro.One)

plot_wordcloud(df, max.words = 100, min.freq = 15)

## ------------------------------------------------------------------------
plot_bars(df, min.freq = 25)

## ------------------------------------------------------------------------
plot_relationships(df, min.freq = 25, threshold = 0.1)

## ------------------------------------------------------------------------
library(cluster)   
tdm <- get_term_document_matrix(df)$tdm

tdm.rst <- removeSparseTerms(tdm, 0.93)

d <- dist(tdm.rst, method="euclidian")   
fit <- hclust(d=d, method="complete")   # for a different look try substituting: method="ward.D"
fit 

## ------------------------------------------------------------------------
plot(fit, hang = 1)

