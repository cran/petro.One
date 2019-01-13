## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(petro.One)
library(dplyr)
library(ggplot2)

# provide two different set of keywords to combine as vectors
major   <- c("artificial intelligence")

results <- run_papers_search(major, 
                             get_papers = TRUE,       # return with papers
                             verbose = FALSE,         # show progress
                             len_keywords = 4,        # naming the data file
                             allow_duplicates = FALSE) # by paper title and id

(papers <- results$papers)

## ------------------------------------------------------------------------
# plot on AI by year of publication
papers %>% 
    group_by(year) %>% 
    na.omit() %>% 
    summarize(n = n()) %>% 
    
    ggplot(., aes(x = year, y = n)) +
    geom_point() +
    geom_smooth(method = "loess") +
    labs(title = "Artificial Intelligence papers by Year")

