## ----packages----
library(readr)
library(dplyr)
library(forcats)
library(stringr)
library(tidyr)
library(labelled)

## ----load-data----

# Data preprocessing: ----

## Read dataset:
penguins_data <- read_csv(
  file = "dat/penguins.csv",
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
penguins_data <- penguins_data |>
  set_variable_labels(
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

## Create a contingency table:
counts_table <-
  penguins_data |>
  group_by(species, island, sex) |>
  count() |>
  ungroup()

## Create descriptive statistics table:
summary_metrics <-
  penguins_data |>
  group_by(species, island, sex) |>
  summarise(mean_bill_length = mean(bill_length_mm),
            se_bill_length = sd(bill_length_mm)/sqrt(n()),
            mean_flipper_length = mean(flipper_length_mm),
            se_flipper_length = sd(flipper_length_mm)/sqrt(n()),
            mean_body_mass = mean(body_mass_g),
            se_body_mass = sd(body_mass_g)/sqrt(n())
  ) |>
  ungroup()


## ----modeling----

bodymass_fit <- lm(body_mass_g ~ sex * species, data = penguins_data)
## TODO: Add covariates? Test model assumptions?


