
<!-- README.md is generated from README.Rmd. Please edit that file -->

# arcgis

<!-- badges: start -->
<!-- badges: end -->

arcgis is a metapackage that loads ArcGIS location services packages.
This includes {arcgislayers}, and {arcgisutils}.

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
