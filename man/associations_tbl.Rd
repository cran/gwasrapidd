% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/class-associations.R
\name{associations_tbl}
\alias{associations_tbl}
\title{Creates an associations table.}
\usage{
associations_tbl(
  association_id = character(),
  pvalue = double(),
  pvalue_description = character(),
  pvalue_mantissa = integer(),
  pvalue_exponent = integer(),
  multiple_snp_haplotype = logical(),
  snp_interaction = logical(),
  snp_type = character(),
  risk_frequency = double(),
  standard_error = double(),
  range = character(),
  or_per_copy_number = double(),
  beta_number = double(),
  beta_unit = character(),
  beta_direction = character(),
  beta_description = character(),
  last_mapping_date = lubridate::ymd_hms(),
  last_update_date = lubridate::ymd_hms()
)
}
\arguments{
\item{association_id}{A character vector of association identifiers.}

\item{pvalue}{A numeric vector of p-values.}

\item{pvalue_description}{A character vector of p-value context descriptions.}

\item{pvalue_mantissa}{An integer vector of p-value mantissas.}

\item{pvalue_exponent}{An integer vector of p-value exponents.}

\item{multiple_snp_haplotype}{A logical vector.}

\item{snp_interaction}{A logical vector.}

\item{snp_type}{A character vector indicating SNP novelty: 'novel' or
'known'.}

\item{standard_error}{A numeric vector of standard errors.}

\item{range}{A character vector of free text descriptions of confidence
intervals.}

\item{or_per_copy_number}{A numeric vector of odds ratios.}

\item{beta_number}{A numeric vector of beta coefficients.}

\item{beta_unit}{A character vector of beta coefficient units.}

\item{beta_direction}{A character vector of beta coefficient directions.}

\item{beta_description}{A character vector of beta descriptions.}

\item{last_mapping_date}{A \code{\link[base:DateTimeClasses]{POSIXct}}
object indicating last time this association was mapped to Ensembl.}

\item{last_update_date}{A \code{\link[base:DateTimeClasses]{POSIXct}} object
indicating the last time the associations have been updated.}
}
\value{
A \code{\link[tibble]{tibble}} whose columns are the named arguments
  to the function.
}
\description{
Creates an associations table.
}
\keyword{internal}
