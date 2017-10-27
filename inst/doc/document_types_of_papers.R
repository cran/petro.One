## ------------------------------------------------------------------------
library(petro.One)

my_url <- make_search_url(query = "well test", 
                          how = "all")          # exact match

get_papers_count(my_url)

## ------------------------------------------------------------------------
sdc <- papers_by_type(my_url)
sdc

## ------------------------------------------------------------------------
library(petro.One)

my_url <- make_search_url(query = "smart completion", 
                          how = "all")          # exact match

sdc    <- papers_by_type(my_url)
sdc

## ------------------------------------------------------------------------
library(petro.One)

my_url <- make_search_url(query = "deepwater")

sdc    <- papers_by_type(my_url)
sdc

## ------------------------------------------------------------------------
my_url <- make_search_url(query = "deepwater", 
                          dc_type = "chapter")

onepetro_page_to_dataframe(my_url)

## ------------------------------------------------------------------------
my_url <- make_search_url(query = "deepwater", 
                          dc_type = "journal-paper")

onepetro_page_to_dataframe(my_url)

## ------------------------------------------------------------------------
my_url <- make_search_url(query = "deepwater", 
                          dc_type = "general")

onepetro_page_to_dataframe(my_url)

## ------------------------------------------------------------------------
my_url <- make_search_url(query = "deepwater", 
                          dc_type = "presentation")

onepetro_page_to_dataframe(my_url)

