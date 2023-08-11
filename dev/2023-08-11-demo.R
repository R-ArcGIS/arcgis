library(arcgis)

# authorize with AGOL
token <- auth_code()

# set the auth token
set_auth_token(token)


# Reading -----------------------------------------------------------------

furl <- "https://services.arcgis.com/P3ePLMYs2RVChkJx/ArcGIS/rest/services/USA_Counties_Generalized_Boundaries/FeatureServer/0"

county_fl <- arc_open(furl)

# basic query capabilities
arc_select(
  county_fl,
  fields = c("state_abbr", "population"),
  where = "population > 1000000"
)


# dplyr compatability
library(dplyr)

# note case sensitivity
county_fl |>
  select(STATE_ABBR, POPULATION) |>
  filter(POPULATION > 1000000) |>
  collect()



# Writing -----------------------------------------------------------------

# read in default data from {sf} R package shapefile
nc <- sf::read_sf(system.file("shape/nc.shp", package = "sf")) |>
  # ensure in web mercator
  sf::st_transform(3857)

# visualize geometry
plot(nc$geometry)

# print
nc

# publish
res <- publish_layer(nc, "North Carolina SIDS")


# Image Service - Reading -------------------------------------------------

img_url <- "https://landsat2.arcgis.com/arcgis/rest/services/Landsat/MS/ImageServer"

landsat <- arc_open(img_url, token = "")

res <- arc_raster(
  landsat,
  xmin = -71, ymin = 43,
  xmax = -67, ymax = 47.5,
  bbox_crs = 4326,
  width = 500,
  height = 500,
  token = ""
)

terra::plotRGB(res, 4, 3, 2, scale = max(landsat[["maxValues"]]))

