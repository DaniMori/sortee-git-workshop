---
title: "Known issues"
output: github_document
---

# Introduction

This is a collection of issues that can be experimented by the participants in
the workshop.

# Known issues

## Logging in to GitHub

### Problem

The participant is not logged in to GitHub

### Cause

They have probably logged in to GitHub in one browser; when they click on a link
to GitHub in the slideshow, it opens in their default browser instead of the
other one.

### Solution

Log in again to GitHub in their default browser.

## Using the GitHub repository template

### Problem

The "use this template" button does not appear in the repository template.

### Cause

The user is not logged in to GitHub (in that browser; see above).

### Solution

Log in again to GitHub in the browser they are using.

## Pasting commands from Zoom to the R console does not work

### Problem

When pasting a command that contains a "literal" from Zoom to the R console, the
command does not work.

### Cause

Zoom formats double quotes as "typographic double quotes", making the literal
invalid.

### Solution

Edit the command manually to change the typographic double quotes by regular
double quotes.

## {pak} does not install

### Problem

{pak} does not install, but stays idle instead while trying to install.

### Cause

Unknown; it may be a connection issue.

### Solution

Deactivate {pak} before restoring the environment, then activate it again.

Follow these steps to do so:

1.  Open file ".Rprofile"

2.  Comment out lines 1 and 5 (leave only line 3: `source("renv/activate.R")`)

3.  Restart the R session (in the Rstudio menu "Session" -\> "Restart R")

4.  Run `renv::restore(confirm = FALSE)`

5.  Wait until the installation of the packages is finished

6.  Revert file ".Rprofile" to its original content (i.e., uncomment lines 1 and

    5)  

7.  Restart the R session again

(Please **note**: A participant that needs to do this will take longer than
usual to restore de {renv} environment.)

## Knitting "README.Rmd" fails

### Problem

"README.Rmd" does not knit; it throws the following error instead:

```         
|........................................          |  80% [software-versions]
 
processing file: README.Rmd
Error in `!continue`:
! invalid argument type
Backtrace:
  1. rmarkdown::render(...)
  2. knitr::knit(knit_input, knit_output, envir = envir, quiet = quiet)
  3. knitr:::process_file(text, output)
  6. knitr:::process_group(group)
  7. knitr:::call_block(x)
  8. knitr:::block_exec(params)
  9. knitr:::eng_r(options)
12. knitr (local) evaluate(...)
13. evaluate::evaluate(...)
 
Quitting from lines 56-62 [software-versions] (README.Rmd)
Execution halted
```

### Cause

Unknown. Possibly that some of the packages are missing, because the {renv}
environment was not completely restored

### Solution

Unknown. Make sure that the {renv} environment is completely updated by running
`renv::status()`. Try to restore the environment running
`renv::restore(confirm = FALSE)` if the environment is not completely restored.
