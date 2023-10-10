
<!-- README.md is generated from README.Rmd. Please edit that file -->

# arcgis

<!-- badges: start -->
<!-- badges: end -->

**NOTE**: under active development! We’d love to hear from you on how
you would like to use locations services R packages. Please [start a
discussion](https://github.com/R-ArcGIS/arcgis/discussions) and we’ll
get back to you there!

arcgis is a meta-package that loads ArcGIS location services packages.
As of this writing, it includes the packages
[`{arcgislayers}`](https://github.com/R-ArcGIS/arcgislayers), and
[`{arcgisutils}`](https://github.com/R-ArcGIS/arcgisutils).

- `arcgislayers` is the workhorse package that interacts with feature
  services and image servers
- `arcgisutils` is a developer oriented package that is used for
  crafting requests to be used by other location service packages such
  as `arcgislayers`

Please refer to [`arcgislayers`](https://r.esri.com/arcgislayers/)
package site for examples.

## Installation

You can install the development version of arcgis from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("R-ArcGIS/arcgis")
```

## Example

``` r
library(arcgis)
#> Attaching core arcgis packages:
#>   - {arcgisutils} v0.1.0
#>   - {arcgislayers} v0.1.0

health_rankings_url <- "https://services.arcgis.com/P3ePLMYs2RVChkJx/arcgis/rest/services/2022_County_Health_Rankings/FeatureServer"

arc_open(health_rankings_url)
#> <FeatureServer <3 layers, 0 tables>>
#> CRS: 4326
#> Capabilities: Query,Extract
#>   0: Country (esriGeometryPolygon)
#>   1: State (esriGeometryPolygon)
#>   2: County (esriGeometryPolygon)
```
