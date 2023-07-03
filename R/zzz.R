.onAttach <- function(...) {
  attached <- arcgis_attach()

  if (length(attached) > 0)
    rlang::inform("Attaching core arcgis packages:", class = "packageStartupMessage")

  for (pkg in attached) {
    pkg_v <- as.character(packageVersion(pkg))
    rlang::inform(
      paste0("  - {", pkg, "} v", pkg_v, sep = ""),
      class = "packageStartupMessage"
    )
  }
}

