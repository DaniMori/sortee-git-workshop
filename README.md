
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

### Dataset [“dat/penguins.csv”](dat/penguins.csv)

Dataset `penguins` from the R [{palmerpenguins}
package](https://cran.r-project.org/package=palmerpenguins) v0.1.1,
originally from:

<div id="refs">

</div>

### Pictures

Origin of all the image files attributed in the corresponding slides in
[“output/slide-deck.qmd”](output/slide-deck.qmd).

# Project installation

## Software components

Start by installing the following software components:

- [R version
  4.4.1](https://cran.rstudio.com/bin/windows/base/old/4.4.1/): In
  Windows, using the [binary
  installer](https://cran.rstudio.com/bin/windows/base/old/4.4.1/R-4.4.1-win.exe)
  is recommended.

<!-- -->

- [Rstudio Desktop](https://posit.co/download/rstudio-desktop/):
  Although not strictly necessary, it is recommended to install the
  Rstudio IDE; for strict reproducibility, use build [2024.04.2+764 for
  Windows
  10/11](https://download1.rstudio.org/electron/windows/RStudio-2024.04.2-764.exe).

<!-- -->

- [Quarto publishing system](https://quarto.org/): An additional
  component used by Rstudio to generate and publish literate computing
  outputs. For strict reproducibility please use build 1.4.555; On
  Windows, use [the 64-bit
  installer](https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.555/quarto-1.4.555-win.msi).

<!-- -->

- [Git client](https://git-scm.com/download): Install the Git client in
  order to be able to clone locally the project repository. On Windows,
  use [the 64-bit Windows
  installer](https://github.com/git-for-windows/git/releases/download/v2.45.2.windows.1/Git-2.45.2-64-bit.exe).

## Installing the project locally

This project is hosted as a GitHub repository. It can be cloned as a
local Git repository following [these
instructions](https://book.cds101.com/using-rstudio-server-to-clone-a-github-repo-as-a-new-project.html#step---2)
(steps 2 through 7). Note that this will create a local copy of
(‘clone’) the GitHub repository as an Rstudio project in the folder
specified. The URL that must be entered into the `Repository URL` text
box is:

    https://github.com/DaniMori/sortee-git-workshop.git

**IMPORTANT:** It is totally unrecommended to clone a git repository
inside a cloud storage folder (e.g., Dropbox, OneDrive). Please note
that GitHub serves the purpose of backing up the repository, so no cloud
storage is necessary. Similarly, cloning the repository in a network
folder may cause problems with the {renv} environment (see below); do it
at your own risk!

After cloning the repository, the Rstudio project will open
automatically in the Rstudio IDE. If it doesn’t, or you want to return
later to the project in Rstudio, you can do so by double clicking on the
file “rstudio_project.Rproj” that has been created in the project folder
when cloning the repository.

**NOTE:** It is common practice to avoid using and versioning
“.Rprofile” files. However, this project uses [package
{renv}](https://cran.r-project.org/package=renv) to create a
reproducible environment, which needs the “.Rprofile” file that lives in
the root directory of the project. **Please DO NOT delete or edit this
file**; it will install and activate the {renv} package and make it
ready for restoring the environment.

## Restoring the environment

The reproducible environment created by {renv} must be restored to
install all the packages this project needs to be built properly. If
{renv} does not initialize automatically (check the console for messages
about this), you will need to manually install the package first:

``` r
install.packages("renv")
```

Once it is successfully installed, use the “renv” -\> “Restore library…”
button in Rstudio’s “Packages” tab to restore the environment.
Alternatively, you can type in the console:

``` r
renv::restore(confirm = FALSE)
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
    |--- output       (Processing outputs; files must be individually "checked-in"
    |                 when necessary)
    |
    |--- renv         (System library necesssary for `renv` to work. DON'T TOUCH)
    |
    |--- src          (Source scripts that implement the main processes)
    |
    |--- www          (Project assets, e.g., images, bibliography files, etc.)

Use the folders as indicated to store the different files and generate
the outputs of the processes.

# How to use this project

The main file in this repository is, \<output/slide-deck.qmd\>, a
[reveal.js](https://revealjs.com/) presentation rendered as the outcome
of a [Quarto](https://quarto.org) document (learn more about the
[Revealjs Quarto
format](https://quarto.org/docs/presentations/revealjs/)).

## Plugins

The following two features are implemented in the presentation:
*Multiplex mode*, and *Speaker view*.

### Multiplex mode

The rendered reveal.js output makes use of the
[multiplex](https://revealjs.com/multiplex/) plugin, which allows the
audience to follow the presentation locally on their computers, in sync
with the host’s. This means that, when rendered,
\<output/slide-deck.qmd\> produces two outputs:

- “output/slide-deck-speaker.html”: This is the *speaker version*, the
  one the host will need to use for presenting the workshop.

- “output/slide-deck.html”: The version distributed to the audience. For
  ease of use during the workshop, a pre-rendered version is linked in
  the first slide (i.e., “Setup”) for the audience to have easier access
  (if it does not work, it means the pre-rendered version is not
  available anymore; in that case, the link can be changed to another
  public one before rendering, if necessary).

### Speaker view

The speaker version of the rendered slide deck has a speaker view that
allows the host to have an ancillary window with the peaker notes. The
speaker view is known to work properly on Chrome 128, while it does not
work in Firefox 130.

## Rendering the slide deck

If you want to use the multiplex mode, you will need to render the
audience version and create a public shareable link with it, then render
the presentation again to make sure the link in the “Setup” slide points
correctly to it.

Follow these steps to do so:

1.  Render file “output/slide-deck.qmd”.

2.  Host output “output/slide-deck.html” (the audience version) in a
    cloud storage service (e.g., Dropbox, OneDrive, etc.).

3.  Create a public link to share the audience version publicly.

4.  Update slide “Setup” with your own link (in line 65).

5.  Render “output/slide-deck.qmd” again.

6.  Overwrite the publicly shared audience version in your cloud storage
    service with the newly rendered “output/slide-deck.html”.

7.  Open “output/slide-deck-speaker.html” in Google Chrome (recommended
    browser for presenting the workshop; see section [Speaker
    view](#speaker-view) above).

8.  Browse to the “Setup” slide (the first after the title) and click on
    the link to test the download of the audience version.

9.  Download the audience version and open it in a new
    window/tab/browser.

10. Browse the speaker version and check that the audience version
    automatically updates in sync with it.
