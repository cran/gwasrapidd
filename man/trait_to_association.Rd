% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/id_mapping.R
\name{trait_to_association}
\alias{trait_to_association}
\title{Map an EFO trait id to an association id}
\usage{
trait_to_association(efo_id, verbose = FALSE, warnings = TRUE)
}
\arguments{
\item{efo_id}{A character vector of EFO trait identifiers.}

\item{verbose}{Whether the function should be
verbose about the different queries or not.}

\item{warnings}{Whether to print warnings.}
}
\value{
A dataframe of two identifiers. First column is the EFO trait
  identifier and the second column is the association identifier.
}
\description{
Map an EFO trait id to an association identifier.
}
\examples{
\dontrun{
# Map EFO trait identifiers to association identifiers
trait_to_association(c('EFO_0005108', 'EFO_0005109'))
}

}
