## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, warning = FALSE, message=FALSE------------------------------------
library(dplyr)
library(tidyr)
library(gwasrapidd)

## ----get_traits---------------------------------------------------------------
all_traits <- get_traits()
dplyr::filter(all_traits@traits, grepl('BMI', trait, ignore.case = TRUE))

## ----get_associations---------------------------------------------------------
bmi_associations <- get_associations(efo_id = 'EFO_0005937')

## ----tables-------------------------------------------------------------------
slotNames(bmi_associations)

## ----result-------------------------------------------------------------------
tbl01 <- dplyr::select(bmi_associations@risk_alleles, association_id, variant_id, risk_allele)
tbl02 <- dplyr::select(bmi_associations@associations, association_id, pvalue, beta_number, beta_unit, beta_direction)

bmi_variants <- dplyr::left_join(tbl01, tbl02, by = 'association_id') %>%
  tidyr::drop_na() %>%
  dplyr::arrange(variant_id, risk_allele)

## ----final--------------------------------------------------------------------
print(bmi_variants, n = Inf)

