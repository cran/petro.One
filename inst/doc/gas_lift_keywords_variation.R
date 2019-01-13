## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(petro.One)

# provide the list of keywords
keywords <- "    
    gas lift
    gas-lift
    GasLift
    gas.lift
    gas_lift"

# convert the text to a dataframe
# read text table and split rows at carriage return
kw_tbl <- read.table(text = keywords, header = FALSE, sep = "\n", 
                     stringsAsFactors = FALSE, strip.white = TRUE, 
                     col.names = "keyword")

## ------------------------------------------------------------------------
# show the dataframe
kw_tbl  

## ----rows.print = 20-----------------------------------------------------
# iterate through the keywords dataframe
rec <- vector("list")
i <- 1
for (k in kw_tbl$keyword) {
    url_all  <- make_search_url(query = k, how = "all")    # create search query
    count    <- get_papers_count(url_all)                  # paper count
    rec[[i]] <- list(keyword = k, count = count)           # add observation
    cat(sprintf("%30s %5d \n", k, count))                  # print it
    i <-  i + 1                                            # increment counter
    Sys.sleep(5)                          # do not bug OnePetro website too much
}                                         # be a good internet citizen


## ------------------------------------------------------------------------
dt <- data.table::rbindlist(rec)                # final data table
dt

## ---- echo=FALSE---------------------------------------------------------
total_count <- sum(dt$count)
percent_of_total <- (dt[keyword == "gas-lift"]$count +  
  dt[keyword == "gas lift"]$count) / total_count * 100
marginal <- dt[keyword == "gas.lift"]$count +  dt[keyword == "gas_lift"]$count

