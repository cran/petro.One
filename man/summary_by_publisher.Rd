% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.R
\name{summary_by_publisher}
\alias{summary_by_publisher}
\title{Summary by publisher}
\usage{
summary_by_publisher(result)
}
\arguments{
\item{result}{a OnePetro page with results}
}
\description{
Generate a summary by publisher.
Know publishers: OTC, SPE, etc.
}
\examples{
\dontrun{
# Example
my_url <- make_search_url(query = "shale gas", how = "all")
page <- read_onepetro(my_url)
summary_by_publisher(page)
}
}
