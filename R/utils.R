# Pipe operator ----------------------------------------------------------------
#' Pipe operator
#'
#' See \code{\link[magrittr]{\%>\%}} for more details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

# Helper functions from bookdown and rticles -----------------------------------
find_file <- function(template, file) {
  template <- system.file("rmarkdown", "templates", template, file,
    package = "jayhawkdown")
  if (template == "") {
    stop("Couldn't find template file ", template, "/", file, call. = FALSE)
  }

  template
}

find_resource <- function(template, file) {
  find_file(template, file.path("resources", file))
}

jayhawkdown_file <- function(...) {
  system.file(..., package = "jayhawkdown", mustWork = TRUE)
}
