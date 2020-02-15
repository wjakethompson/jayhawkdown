test_that("unknown template errors", {
  expect_error(find_resource("kansas", "template2.tex"),
               "Couldn't find template")
  expect_error(find_resource("kansas", "template.docx"),
               "Couldn't find template")
})

test_that("thesis-pdf renders", {
  testthat::skip_on_cran()
  testthat::skip_on_travis()
  testthat::skip_on_appveyor()

  # work in a temp directory
  new_dir <- tempfile()
  dir.create(new_dir)
  oldwd <- setwd(new_dir)
  on.exit(setwd(oldwd), add = TRUE)

  jayhawkdown_skeleton(new_dir)
  bookdown::render_book("index.Rmd", output_format = "jayhawkdown::thesis_pdf",
                        clean_envir = FALSE)
  print(paste("6:", new_dir))
  expect_true(dir.exists("_book"))
  print(paste("7:", new_dir))
  expect_true(file.exists(file.path("_book",
                                    paste0(basename(as.character(new_dir)),
                                           ".pdf"))))
})
