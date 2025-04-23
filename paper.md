---
title: "`arcgislayers`: an open source package for ArcGIS Location Services"
authors:
  name: Josiah Parry
  affiliation: Environmental Systems Research Institute, Redlands, CA, USA
freeze: true
---


## Summary

arcgislayers is an open source package as part of Environmental Systems Research Institute's (Esri) R-ArcGIS Bridge project. arcgislayers enables developers to interact with ArcGIS data services directly from R. With arcgislayers, users can read, write, and administer remotely hosted data directly from R using native objects. 

## Statement of need

In the evolving landscape of geospatial analysis, a critical shift towards cloud-native infrastructure has emerged, characterized by the exposure of data via REST APIs. Esri's ArcGIS Location Services characterized by ArcGIS Platform embody this transition. Location services are accessible via REST API endpoints which which are language agnostic. 

While existing solutions like arcgisbinding enable reading and writing of ArcGIS hosted data, they present limitations (Aydin et al.). Notably, arcgisbinding relies on an ArcGIS Pro license which is confined to a Windows operating system, and does not support any additional administration of hosted data services.

Moreover, the community-driven endeavors such as esri2sf, arcpullr, among others, strive to bridge this gap (CITE). However, these efforts fall short in delivering comprehensive, officially supported, and high-performance alternatives.

arcgislayers is an official, Esri-backed, open-source R package designed to interact with ArcGIS Image Servers and Feature Services. Leveraging the REST services offered by ArcGIS, arcgislayers empowers developers to seamlessly administer, read, and write data without the constraints of proprietary licenses or operating systems.


# Implementation 

arcgislayers supports both Image Servers and Feature Services. When reading raster imagery, arcgislayers returns objects of class `SpatRaster` from the terra package. arcgislayers' vector capabilities are much more sophisticated, however. 

In the r-spatial ecosystem, sf objects are the de facto representation of geometric objects with associated attributes. As such, arcgislayers utilizes sf objects and data.frames to represent spatial and a-spatial data respectively. Due to the ubiquity of sf objects additional geometry types are not supported directly but can be via wk (edzer, probably bivand somewhere inhere dunnington).

The ArcGIS REST API defines a number of JSON objects that are understood by the endpoints. Notably, the REST APIs have their own definitions for geometries objects. Underpinning arcgislayers is the R package arcgisutils which is used for serializing data.frame and sf objects into Esri JSON formats. arcgisutils also provides utilities for deserializing Esri JSON returned from the REST APIs into sf or data.frame objects. 

The de/serialization provided by arcgisutils enables seamless reading and writing of geospatial data with ArcGIS Location Services. 


::: {.cell}

```{.r .cell-code}
sf::st_point(c(3.0, 0.14)) |> 
  arcgisutils::as_esri_geometry() |> 
  jsonify::pretty_json()
```

::: {.cell-output .cell-output-stdout}

```
{
    "hasZ": false,
    "hasM": false,
    "x": 3.0,
    "y": 0.14,
    "spatialReference": {
        "wkid": 4326
    }
}
```


:::
:::



## Example usage 


::: {.cell}

```{.r .cell-code}
library(arcgislayers)

url <- "https://services3.arcgis.com/ZvidGQkLaDJxRSJ2/arcgis/rest/services/PLACES_LocalData_for_BetterHealth/FeatureServer/0"

flayer <- arc_open(url)
flayer
```

::: {.cell-output .cell-output-stdout}

```
<FeatureLayer <28484 features, 154 fields>>
Name: PlacePoints
Geometry Type: esriGeometryPoint
CRS: 3785
Capabilities: Query,Extract
```


:::
:::




------- 

Notes 



- Aydin et al introduce arcgisbinding which provides a binding to ArcGIS pro enabling the reading and writing of ArcGIS Proprietary data formats and on the fly geospatial transformations using the transformation engine
- We're seeing a shift towards cloud-native geospatial analysisdata infrastructure which are exposed via rest apis
- Esri provides very useful technology via ArcGIS Location Services. Location services are exposed via rest APIs which are well documented. Endpoints can be both public or private depending on the hosting solution and authentication used. 
- REST services provide a language agnostic interface to proprietary code allowing the development of completely open source bindings to the services

- While arcgisbinding provides a way for users of R _and_ ArcGIS Pro to read image and feature services it is fairly limited. Noteably, the use of arcgisbinding requires an ArcGIS Pro license which itself requires a window machine. Further, arcgisbinding does not provide further capabilities for hosted data management. 

- arcgislayers builds upon the REST service provided by ArcGIS. arcgislayers is an open source R package for interacting with ArcGIS image servers and Feature services. 

- there are a number of community driven efforts to address this gap which are notably esri2sf, arcpullr, among others. 

- arcgislayers is an official, esri supported, and highly performant alternative to these packages
