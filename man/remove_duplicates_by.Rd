% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-papers.R
\name{remove_duplicates_by}
\alias{remove_duplicates_by}
\title{Remove duplicate papers by a variable}
\usage{
remove_duplicates_by(df, by = "book_title")
}
\arguments{
\item{df}{dataframe of papers}

\item{by}{variable}
}
\description{
Duplicates are removed in a dataframe containing papers
}
\examples{
\dontrun{
major <- c("data driven")
minor <- c("drilling")
dd_drilling <- join_keywords(major, minor, get_papers = TRUE, sleep = 3,
                             verbose = FALSE)
remove_duplicates_by(dd_drilling$papers, by ="paper_id" )
}
}
