## ------------------------------------------------------------------------
library(petro.One)


## ------------------------------------------------------------------------
my_url <- make_search_url(query = "pressure transient analysis", 
                          how = "all")

get_papers_count(my_url)

## ------------------------------------------------------------------------
papers_by_type(my_url)

## ------------------------------------------------------------------------
# we use "conference-paper" only because other document types have
# different dataframe structure

my_url_1 <- make_search_url(query = "pressure transient analysis", 
                          how = "all", 
                          dc_type = "conference-paper",
                          start = 0,
                          rows  = 1000)

get_papers_count(my_url_1)

page_1 <- read_onepetro(my_url_1)
htm_1 <- "pta-01-conference.html"
xml2::write_html(page_1, file = htm_1)
onepetro_page_to_dataframe(htm_1)

## ------------------------------------------------------------------------
my_url_2 <- make_search_url(query = "pressure transient analysis", 
                          how = "all", 
                          dc_type = "conference-paper",
                          start = 1000,
                          rows  = 1000)

page_2 <- read_onepetro(my_url_2)
htm_2 <- "pta-02-conference.html"
xml2::write_html(page_2, file = htm_2)
onepetro_page_to_dataframe(htm_2)

## ------------------------------------------------------------------------
my_url_3 <- make_search_url(query = "pressure transient analysis", 
                          how = "all", 
                          dc_type = "conference-paper",
                          start = 2000,
                          rows  = 1000)

page_3 <- read_onepetro(my_url_3)
htm_3 <- "pta-03-conference.html"
xml2::write_html(page_3, file = htm_3)
onepetro_page_to_dataframe(htm_3)

## ------------------------------------------------------------------------
my_url_4 <- make_search_url(query = "pressure transient analysis", 
                          how = "all", 
                          dc_type = "conference-paper",
                          start = 3000,
                          rows  = 100)

page_4 <- read_onepetro(my_url_4)
htm_4 <- "pta-04-conference.html"
xml2::write_html(page_4, file = htm_4)
onepetro_page_to_dataframe(htm_4)

## ------------------------------------------------------------------------

p1 <- onepetro_page_to_dataframe(htm_1)
p2 <- onepetro_page_to_dataframe(htm_2)
p3 <- onepetro_page_to_dataframe(htm_3)
p4 <- onepetro_page_to_dataframe(htm_4)

papers <- rbind(p1, p2, p3, p4)
papers

## ------------------------------------------------------------------------
pattern <- "pressure transient analysis"
rows <- grep(pattern = pattern, papers$title_data, ignore.case = TRUE)
papers[rows, ]

## ------------------------------------------------------------------------
# remove files that were created
files <- c(htm_1, htm_2, htm_3, htm_4)
file.remove(files)

