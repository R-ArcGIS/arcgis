.onAttach <- function(...) {
  attached <- arcgis_attach()

  if (length(attached) > 0) {
    cli::cli_inform(
      "Attaching core {.pkg arcgis} packages:",
      class = "packageStartupMessage"
    )
    pkg_ul(attached)
  }
}

pkg_ul <- function(pkgs) {
  pkg_versions <- vapply(
    pkgs,
    function(.x) as.character(utils::packageVersion(.x)),
    character(1)
  )

  for (i in seq_along(pkgs)) {
    pkg <- pkgs[i]
    ver <- pkg_versions[i]
    cli::cli_inform(
      c(">" = "{.pkg {pkg}} v{ver}"),
      class = "packageStartupMessage"
    )
  }
}
