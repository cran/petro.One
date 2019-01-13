## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- rows.print=25------------------------------------------------------
library(petro.One)

major <- c("gas influx")
minor <- c("overbalanced", "shut in")
lesser <- c("shale", "drilling")
more <- c("gas diffusion", "concentration gradient")


paper_results <- run_papers_search(major, minor, lesser, more,
                                   get_papers = TRUE,       # return with papers
                                   verbose = FALSE,         # show progress
                                   len_keywords = 4,        # naming the data file
                                   allow_duplicates = FALSE) # by paper title and id

(papers <- paper_results$papers)

## ------------------------------------------------------------------------
library(petro.One)

major <- c("gas influx")
minor <- c("overbalanced", "shut in", "shut-in")
lesser <- c("shale", "drilling", "logging")
more <- c("desorption", "concentration gradient")
author <- c("British Petroleum", "BP")

paper_results <- run_papers_search(major, minor, lesser, more, author,
                                   get_papers = TRUE,       # return with papers
                                   verbose = FALSE,         # show progress
                                   len_keywords = 4,        # naming the data file
                                   allow_duplicates = FALSE) # by paper title and id

(papers <- paper_results$papers)

# returns "no non-missing arguments to max; returning -Inf"

## ------------------------------------------------------------------------
# library(xlsx)
# write.xlsx2(papers <- paper_results$papers, file = "gas_influx_gas_difusion.xlsx")

