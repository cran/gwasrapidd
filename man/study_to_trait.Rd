% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/id_mapping.R
\name{study_to_trait}
\alias{study_to_trait}
\title{Map a study id to a EFO trait id}
\usage{
study_to_trait(study_id, verbose = FALSE, warnings = TRUE)
}
\arguments{
\item{study_id}{A character vector of study accession identifiers.}

\item{verbose}{Whether the function should be
verbose about the different queries or not.}

\item{warnings}{Whether to print warnings.}
}
\value{
A dataframe of two identifiers. First column is the study identifier
  and the second column is the EFO identifier.
}
\description{
Map a study accession identifier to a EFO trait identifier.
}
\examples{
\dontrun{
# Map GWAS study identifiers to EFO trait identifiers
study_to_trait(c('GCST001084', 'GCST001085'))
}

}
