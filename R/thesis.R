#' Creates an R Markdown PDF Thesis Document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the University of Kansas LaTeX template and cls files.
#'
#'
#' @param toc A Boolean (TRUE or FALSE) specifying where table of contents should be created
#' @param toc_depth A positive integer
#' @param ... arguments to be passed to \code{rmarkdown::\link[rmarkdown]{pdf_document}}
#'
#' @return A modified `pdf_document` based on the Reed Senior Thesis LaTeX
#'   template
#' @note The arguments highlight, keep_tex, and pandoc_args, are already set.
#' @examples
#' \dontrun{
#'  output: jayhawkdown::thesis_pdf
#' }
#' @export
thesis_pdf <- function(toc = TRUE, toc_depth = 3, ...){
  base <- bookdown::pdf_book(template = "template.tex", toc = toc,
    toc_depth = toc_depth, highlight = "pygments", keep_tex = TRUE,
    pandoc_args = "--top-level-division=chapter", ...)

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- NA
  base$knitr$opts_chunk$fig.align <- "center"
  base$knitr$opts_chunk$out.width <- "80%"
  base$knitr$opts_knit$root.dir <- getwd()

  base
}

#' Creates an R Markdown gitbook Thesis Document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify the creation of a webpage version of the thesis.
#'
#' @return A gitbook webpage
#' @examples
#' \dontrun{
#'  output: jayhawkdown::thesis_gitbook
#' }
#' @export
thesis_gitbook <- function(){
  base <- bookdown::gitbook(split_by = "chapter+number",
    config = list(toc = list(collapse = "section",
      before = '<li><a href="./"></a></li>',
      after = '<li><a href="https://github.com/wjakethompson/jayhawkdown" target="blank">Published with jayhawkdown</a></li>')
    )
  )

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- NA
  base$knitr$opts_chunk$fig.align <- "center"
  base$knitr$opts_chunk$out.width <- "80%"
  base$knitr$opts_knit$root.dir <- getwd()

  base
}

#' Generate a section for the yaml input
#'
#' @param input a file containing markdown text
#' @param sep a separator for each line.
#'
#' @return a string
#'
#' @export
inc <- function(input, sep = "\n\n  "){
  paste(readLines(input), collapse = sep)
}
