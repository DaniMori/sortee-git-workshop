
# Respository `sortee-git-workshop`

Workshop “Reproducible research and collaboration in git and GitHub” at
the 2024 SORTEE Conference.

Forked (explicitly) and adapted from the repository “Version control for
scientific workflows workshop”, project for a workshop ran at the
Division of Insurance Medicine, Karolinska Institutet, on June 20, 2023.

# License

This repository is licensed under the [Creative Commons Attribution 4.0
International license](https://creativecommons.org/licenses/by/4.0/).
Please see the [license file](LICENSE.md).

## Attributions

This project makes use of the
[rproj-template](https://github.com/DaniMori/rproj-template) Github
template created by [Daniel Morillo](https://github.com/DaniMori) and
licensed under the [Creative Commons Attribution 4.0 International
license](https://creativecommons.org/licenses/by/4.0/).

### Dataset [`dat/breslow_chatterjee_1999.csv`](dat/breslow_chatterjee_1999.csv)

Dataset `nwtco` from the R [survival
package](https://cran.r-project.org/package=survival) v3.5-5, originally
from:

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-breslow_design_1999" class="csl-entry">

Breslow, N. E., and N. Chatterjee. 1999. “Design and Analysis of
Two-Phase Studies with Binary Outcome Applied to Wilms Tumour
Prognosis.” *Journal of the Royal Statistical Society: Series C (Applied
Statistics)* 48 (4): 457–68. <https://doi.org/10.1111/1467-9876.00165>.

</div>

</div>

### Script [`src/Analysis.R`](src/Analysis.R)

Adapted from the [`nwtco` help
page](https://www.rdocumentation.org/packages/survival/versions/3.5-5/topics/nwtco)
of the R [survival package](https://cran.r-project.org/package=survival)
v3.5-5.

### Pictures

Origin of all the image files attributed in the corresponding slides in
[`output/slide-deck.qmd`](output/slide-deck.qmd).

# Project installation

## Software components

- Install [R version
  4.3.0](https://cran.rstudio.com/bin/windows/base/old/4.3.0/): In
  Windows, using the [binary
  installer](https://cran.rstudio.com/bin/windows/base/old/4.3.0/R-4.3.0-win.exe)
  is recommended.

<!-- -->

- [Rstudio
  Desktop](https://www.rstudio.com/products/rstudio/download/#download):
  Although not strictly necessary, it is recommended to install the
  Rstudio IDE; for strict reproducibility, use build [2023.03.1+446 for
  Windows
  10/11](https://download1.rstudio.org/electron/windows/RStudio-2023.03.1-446.exe).

<!-- -->

- [Quarto publishing system](https://quarto.org/): An additional
  component used by Rstudio to generate and publish literate computing
  outputs. For strict reproducibility please use build 1.3.353; On
  Windows, use [the 64-bit
  installer](https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.353/quarto-1.3.353-win.msi).

<!-- -->

- [Git client](https://git-scm.com/download): Install the Git client in
  order to be able to clone locally the project repository. On Windows,
  use [the 64-bit Windows
  installer](https://github.com/git-for-windows/git/releases/download/v2.40.1.windows.1/Git-2.40.1-64-bit.exe).

## Installing the project locally

This project is hosted as a GitHub repository. It can be cloned as a
local Git repository following [these
instructions](https://book.cds101.com/using-rstudio-server-to-clone-a-github-repo-as-a-new-project.html#step---2)
(steps 2 through 7). Note that this will create a local copy of
(‘clone’) the GitHub repository as an Rstudio project in the folder
specified. The URL that must be entered into the `Repository URL` text
box is:

    https://github.com/DaniMori/sortee-git-workshop.git

After cloning the repository, the Rstudio project will open
automatically in the Rstudio IDE. If it doesn’t, or you want to return
later to the project in Rstudio, you can do so by double clicking on the
file `rstudio_project.Rproj` that has been created in the project folder
when cloning the repository.

**NOTE:** It is common practice to avoid using and versioning
`.Rprofile` files. However, this project uses [package
`renv`](https://cran.r-project.org/package=renv) to create a
reproducible environment, which needs the `.Rprofile` file that lives in
the root directory of the project. **Please DO NOT delete or edit this
file**; it will install and activate the `renv` package and make it
ready for restoring the environment.

## Restoring the environment

The reproducible environment created by `renv` must be restored to
install all the packages this project needs to be built properly. In
order to this, you will need to install package `renv` first:

``` r
install.packages("renv")
```

Once it is successfully installed, use the “renv” -\> “Restore library…”
button in Rstudio’s “Packages” tab to restore the environment.
Alternatively, you can type in the console:

``` r
renv::restore()
```

# Repository structure

The file structure of this repository is as follows:

    sortee-git-workshop
    |
    |--- dat          (To store input datasets; must NEVER be checked-in to Github)
    |
    |--- doc          (To store important documentation of the project)
    |    |
    |    |--- minutes (To store meeting minutes)
    |
    |--- notebooks    (Notebooks to explore data and test processes live here)
    |
    |--- output       (Processing outputs; files must be individually "checked-in"
    |                 when necessary)
    |
    |--- R            (R functions created for this project live here)
    |
    |--- renv         (System library necesssary for `renv` to work. DON'T TOUCH)
    |
    |--- src          (Source scripts that implement the main processes)
    |
    |--- www          (Project assets, e.g., images, bibliography files, etc.)

Use the folders as indicated to store the different files and generate
the outputs of the processes.
