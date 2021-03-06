% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.R
\name{summary_by_publications}
\alias{summary_by_publications}
\title{Summary by publication}
\usage{
summary_by_publications(result)
}
\arguments{
\item{result}{a OnePetro page with results}
}
\description{
Generate a summary by publications. These publications could
be World Petroleum Congress, Annual Technical
Meeting, SPE Unconventional Reservoirs Conference, etc.
}
\examples{
\dontrun{
# Example
my_url <- make_search_url(query = "industrial drilling", how = "all")
result <- read_onepetro(my_url)
summary_by_publications(result)
}
}
