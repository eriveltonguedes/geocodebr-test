install.packages(c("tidyverse", "usethis", "renv",
                   "here", "fuzzyjoin", "furrr",
                   "dbplyr", "arrow", "vroom",
                   "duckdb", "sf", "geobr", "quarto")) 


install.packages('tinytex')

remotes::install_github('rstudio/tinytex')

tinytex::install_tinytex()
