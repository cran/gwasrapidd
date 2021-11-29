# Based on:
# - https://ropensci.org/blog/2019/12/08/precompute-vignettes/
# - https://github.com/jeroen/jsonlite/blob/v1.6/vignettes/precompile.R

# Vignettes that depend on internet resources are precompiled:

knitr::knit("vignettes/gwasrapidd.Rmd.orig", "vignettes/gwasrapidd.Rmd")
knitr::knit("vignettes/faq.Rmd.orig", "vignettes/faq.Rmd")
knitr::knit("vignettes/bmi_variants.Rmd.orig", "vignettes/bmi_variants.Rmd")

devtools::build_vignettes()
