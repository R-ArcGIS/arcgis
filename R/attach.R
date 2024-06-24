# cribbed from https://github.com/tidyverse/tidyverse/blob/main/R/attach.R
# Uses MIT license
core <- c("arcgisutils", "arcgislayers", "arcgisgeocode", "arcgisplaces")

ignore_imports <- function() {
  arcgisutils::compact(list())
  arcgislayers::xss_defaults()
  arcgisgeocode::default_geocoder()
  arcgisplaces::fields
  httr2::request()
}


core_unloaded <- function() {
  search <- paste0("package:", core)
  core[!search %in% search()]
}

# Attach the package from the same package library it was
same_library <- function(pkg) {
  loc <- if (pkg %in% loadedNamespaces()) dirname(getNamespaceInfo(pkg, "path"))
  library(pkg, lib.loc = loc, character.only = TRUE, warn.conflicts = FALSE)
}

# attaches all the packages from core that are not loaded
arcgis_attach <- function() {
  to_load <- core_unloaded()
  suppressPackageStartupMessages(
    lapply(to_load, same_library)
  )

  invisible(to_load)
}

#' List all arcgis packages
#'
#' @param include_self default `TRUE`. Includes the "arcgis" package name in the
#'   resultant character vector.
#' @returns A character vector of package names included in the "arcgis" meta-package.
#' @export
#' @examples
#' arcgis_packages()
#'
# https://github.com/tidyverse/tidyverse/blob/main/R/utils.R
arcgis_packages <- function(include_self = TRUE) {
  pkgs <- core
  if (include_self) {
    pkgs <- c(pkgs, "arcgis")
  }
  pkgs
}
