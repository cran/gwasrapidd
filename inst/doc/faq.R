## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  library(gwasrapidd)
#  is_ebi_reachable()

## ----eval=FALSE---------------------------------------------------------------
#  library(gwasrapidd)
#  is_ebi_reachable(chatty = TRUE)

## -----------------------------------------------------------------------------
library(gwasrapidd)
get_metadata()

## -----------------------------------------------------------------------------
library(gwasrapidd)
get_studies(study_id = c('GCST002420', 'GCST000392'))

## -----------------------------------------------------------------------------
get_associations(variant_id = c('rs3798440', 'rs7329174'))

## -----------------------------------------------------------------------------
get_associations(efo_trait = c('braces', 'binge eating', 'gambling'))

## -----------------------------------------------------------------------------
get_traits(pubmed_id = c('24882193', '22780124'))

## -----------------------------------------------------------------------------
library(gwasrapidd)
efo_trait <- get_traits(study_id = 'GCST000206')
efo_trait@traits$trait

## -----------------------------------------------------------------------------
study <- get_studies(study_id = 'GCST000206')
study@studies$reported_trait

## -----------------------------------------------------------------------------
library(gwasrapidd)
# 'chromosome' names are case sensitive, and should be uppercase.
# 'start' and 'end' positions should be integer vectors.
my_genomic_range <- list(
  chromosome = 'Y',
  start = 14692000L,
  end = 14695000L)

## -----------------------------------------------------------------------------
chr_Y_variants <- get_variants(genomic_range = my_genomic_range)
chr_Y_variants@variants[c('variant_id', 'functional_class')]

## -----------------------------------------------------------------------------
my_genomic_range <- list(
  chromosome = c('X', 'Y'),
  start = c(13000000L, 13000000L),
  end = c(15000000L, 15000000L))

chr_XY_variants <- get_variants(genomic_range = my_genomic_range)
chr_XY_variants@variants[c('variant_id',
                           'chromosome_name',
                           'chromosome_position')]

## -----------------------------------------------------------------------------
my_variants <- get_variants(cytogenetic_band = 'Yq11.221')
my_variants@variants[c('variant_id',
                       'chromosome_name',
                       'chromosome_position')]

## -----------------------------------------------------------------------------
# ?cytogenetic_bands for more details.
cytogenetic_bands

## -----------------------------------------------------------------------------
# Install package dplyr if you do not have it.
chr21_p_bands <- dplyr::filter(cytogenetic_bands, grepl('^21p', cytogenetic_band)) %>%
  dplyr::pull(cytogenetic_band)
chr21_p_bands

## -----------------------------------------------------------------------------
my_variants <- get_variants(cytogenetic_band = chr21_p_bands)
my_variants@variants[c('variant_id',
                       'chromosome_name',
                       'chromosome_position',
                       'chromosome_region')]

## -----------------------------------------------------------------------------
library(gwasrapidd)
# Install dplyr first.
dplyr::filter(cytogenetic_bands, chromosome == '15') %>%
  dplyr::summarise(chromosome = dplyr::first(chromosome),
                   start = min(start),
                   end = max(end)
                   )

## -----------------------------------------------------------------------------
library(gwasrapidd)
my_efo_ids <- c('EFO_0005543', 'EFO_0004762')
my_variants <- get_variants(efo_id = my_efo_ids)
my_variants@variants$variant_id

## -----------------------------------------------------------------------------
# Install purrr first.
# Add names to my_efo_ids
names(my_efo_ids) <- my_efo_ids
my_variants <- purrr::map(my_efo_ids, ~ get_variants(efo_id = .x))

## -----------------------------------------------------------------------------
my_variants[['EFO_0005543']]@variants$variant_id

## -----------------------------------------------------------------------------
my_variants[['EFO_0004762']]@variants$variant_id

## -----------------------------------------------------------------------------
my_variants_OR <- get_variants(
  efo_trait = 'triple-negative breast cancer',
  gene_name = 'MDM4',
  set_operation = 'union')

my_variants_OR@variants[c('variant_id',
                       'chromosome_name',
                       'chromosome_position',
                       'chromosome_region')]

## -----------------------------------------------------------------------------
my_variants_AND <- get_variants(
  efo_trait = 'triple-negative breast cancer',
  gene_name = 'MDM4',
  set_operation = 'intersection')

my_variants_AND@variants[c('variant_id',
                       'chromosome_name',
                       'chromosome_position',
                       'chromosome_region')]

## -----------------------------------------------------------------------------
my_variants <- get_variants(gene_name = c('RNU6-367P', 'TOPAZ1'))

my_variants@variants[c('variant_id',
                       'chromosome_name',
                       'chromosome_position',
                       'chromosome_region')]

## -----------------------------------------------------------------------------
my_variants1 <- get_variants(gene_name = 'RNU6-367P')

my_variants1@variants[c('variant_id',
                       'chromosome_name',
                       'chromosome_position',
                       'chromosome_region')]

## -----------------------------------------------------------------------------
my_variants2 <- get_variants(gene_name = 'TOPAZ1')

my_variants2@variants[c('variant_id',
                       'chromosome_name',
                       'chromosome_position',
                       'chromosome_region')]

## -----------------------------------------------------------------------------
variants_intersect <- intersect(my_variants1, my_variants2)
variants_intersect@variants[c('variant_id',
                       'chromosome_name',
                       'chromosome_position',
                       'chromosome_region')]

## ----echo=FALSE, fig.align="left"---------------------------------------------
# All defaults
knitr::include_graphics("../man/figures/child_trait.png")

## -----------------------------------------------------------------------------
library(gwasrapidd)
my_efo_id <- 'EFO_0005543'
my_studies <- get_studies(efo_id = my_efo_id)
n(my_studies)

## -----------------------------------------------------------------------------
child_efo_ids <- get_child_efo(efo_id = my_efo_id)
my_studies_w_children <- get_studies(efo_id = c(my_efo_id, child_efo_ids[['my_efo_id']]))
n(my_studies_w_children)

