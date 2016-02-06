#' Reloads the .Rprofile
#'
#' This is useful for cases when we clear our workspace, but would like to keep
#' variables we have defined within our profile.
#'
#' @section Warnings:
#' Defaults to the global .Rprofile, but can be changed to load a different
#' .Rprofile (e.g. for a Rproject).
#'
#' param my.dir Parent directory for the .Rprofile
#' @export

reload_profile <- function(my.dir=Sys.getenv("HOME")){

  profile <- file.path(my.dir, ".Rprofile")

  if (file.exists(my_profile)){
    source(profile)
  } else {
    stop(paste0("Unable to locate .Rprofile in ", my.dir))
  }

}
