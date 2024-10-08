## ----packages----
library(readr)
library(dplyr)
library(forcats)
library(stringr)
library(tidyr)
library(labelled)
# library(gtsummary) ## TODO: Install {gtsummary} if necessary

## ----main----

## ----load-data----

# Data preprocessing: ----

## Read dataset:
penguins_data <- read_csv(
  # TODO: Change "<dataset_filename>" by the name of your own dataset, if
  #   necessary (e.g., "dat/penguins.csv")
  file = "dat/<dataset_filename>.csv",
  col_types = cols(
    species  = col_factor(),
    island   = col_factor(),
    sex      = col_factor(),
    year     = col_integer(),
    .default = col_double()
  )
)


## ----preprocess-data----

## Recode values:
penguins_data <- penguins_data |>
  mutate(sex = sex |> fct_relabel(str_to_sentence))

## Assign labels:
# (see https://allisonhorst.github.io/palmerpenguins/reference/penguins.html
#   for more info):
penguins_data <- penguins_data |> set_variable_labels(
  species           = "Penguin species",
  island            = "Island in Palmer Archipielago",
  bill_length_mm    = "Bill length (mm)",
  bill_depth_mm     = "Bill depth (mm)",
  flipper_length_mm = "Flipper length (mm)",
  body_mass_g       = "Body mass (g)",
  sex               = "Sex",
  year              = "Study year"
)


## Filter out cases with missing data:
penguins_data <- penguins_data |> drop_na()


## ----descriptives----

## Simple summary:
penguins_data |> summary()

## Create descriptive statistics table:
# descriptive_table <- penguins_data |> tbl_summary()
# descriptive_table
## TODO: Uncomment if using {gtsummary}

## Create contingency table of sex and species:
# contingency_table <- penguins_data |> tbl_cross(row = sex, col = species)
# contingency_table
## TODO: Uncomment if using {gtsummary}


## ----modeling----

bodymass_fit <- lm(body_mass_g ~ sex * species, data = penguins_data)
## TODO: Add covariates? Test model assumptions?

# NOTE: Output table not created, as `gtsummary` package is too heavy
# bodymass_coef_table <- bodymass_fit |> tbl_regression()
# bodymass_coef_table
## TODO: Uncomment if using {gtsummary}
