## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo=FALSE, fig.align="left", out.width=500, fig.cap="Figure 1 | gwasrapidd retrieval functions."----
# All defaults
knitr::include_graphics("../man/figures/get_fns.png")

## -----------------------------------------------------------------------------
library(gwasrapidd)
my_studies <- get_studies(study_id = 'GCST000858', variant_id = 'rs12752552')

## -----------------------------------------------------------------------------
s1 <- get_studies(study_id = 'GCST000858')
s2 <- get_studies(variant_id = 'rs12752552')
my_studies <- union(s1, s2)

## ----echo=FALSE, fig.align="left", out.width=500, fig.cap="Figure 2 | gwasrapidd arguments for retrieval functions. Colors indicate the criteria that can be used for retrieving GWAS Catalog entities: studies (green), associations (red), variants (purple), and traits (orange)."----
# All defaults
knitr::include_graphics("../man/figures/get_criteria.png")

## -----------------------------------------------------------------------------
library(gwasrapidd)

## -----------------------------------------------------------------------------
my_studies <- get_studies(efo_trait = 'autoimmune disease')

## -----------------------------------------------------------------------------
n(my_studies)
my_studies@studies$study_id

## -----------------------------------------------------------------------------
my_studies@publications$title

## -----------------------------------------------------------------------------
# This launches your web browser at https://www.ncbi.nlm.nih.gov/pubmed/26301688
open_in_pubmed(my_studies@publications$pubmed_id) 

## -----------------------------------------------------------------------------
# You could have also used get_associations(efo_trait = 'autoimmune disease')
my_associations <- get_associations(study_id = my_studies@studies$study_id)

## -----------------------------------------------------------------------------
n(my_associations)

## -----------------------------------------------------------------------------
# Get association ids for which pvalue is less than 1e-6.
dplyr::filter(my_associations@associations, pvalue < 1e-6) %>% # Filter by p-value
  tidyr::drop_na(pvalue) %>%
  dplyr::pull(association_id) -> association_ids # Extract column association_id

## -----------------------------------------------------------------------------
# Extract associations by association id
my_associations2 <- my_associations[association_ids]
n(my_associations2)

## -----------------------------------------------------------------------------
my_associations2@risk_alleles[c('variant_id', 'risk_allele', 'risk_frequency')] %>%
  print(n = Inf)

