test_that("copying jayhawkdown files works", {
  testthat::skip_on_cran()

  # work in a temp directory
  dir <- tempfile()
  dir.create(dir)
  oldwd <- setwd(dir)
  on.exit(setwd(oldwd), add = TRUE)

  jayhawkdown_skeleton(dir)
  check_files <- list.files(dir, include.dirs = TRUE, recursive = TRUE)

  exp_files <- c("_bookdown.yml", "_output.yml", "bib", "bib/packages.bib",
                 "bib/references.bib", "chapters", "chapters/01-intro.Rmd",
                 "chapters/02-lit-review.Rmd", "chapters/03-methods.Rmd",
                 "chapters/04-results.Rmd", "chapters/05-discussion.Rmd",
                 "chapters/90-references.Rmd", "chapters/91-appendix1.Rmd",
                 "csl", "csl/apa.csl", "css", "css/style.css", "data",
                 "figures", "index.Rmd", "kuthesis.cls", "pre",
                 "pre/00-abstract.Rmd", "pre/00-acknowledge.Rmd")

  expect_equal(sort(check_files),
               sort(exp_files))
})
