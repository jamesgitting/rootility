#' Non-matching values
#'
#' This tests for non-membership of a given vector.
#'
#' @param x vector or \code{NULL}
#' @param y vector or \code{NULL}
#' @export
#' @examples
#' 1:10 %ni% c(1, 3, 5, 9)
#'
#' @family vector_functions

`%ni%` <- function(x, y){
  !(x %in% y)
}
