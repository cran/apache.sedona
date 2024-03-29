% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_interface.R
\name{sedona_save_spatial_rdd}
\alias{sedona_save_spatial_rdd}
\title{Save a Spark dataframe containing exactly 1 spatial column into a file.}
\usage{
sedona_save_spatial_rdd(
  x,
  spatial_col,
  output_location,
  output_format = c("wkb", "wkt", "geojson")
)
}
\arguments{
\item{x}{A Spark dataframe object in sparklyr or a dplyr expression
representing a Spark SQL query.}

\item{spatial_col}{The name of the spatial column.}

\item{output_location}{Location of the output file.}

\item{output_format}{Format of the output.}
}
\value{
No return value.
}
\description{
Export serialized data from a Spark dataframe containing exactly 1 spatial
column into a file.
}
\examples{
library(sparklyr)
library(apache.sedona)

sc <- spark_connect(master = "spark://HOST:PORT")

if (!inherits(sc, "test_connection")) {
  tbl <- dplyr::tbl(
    sc,
    dplyr::sql("SELECT ST_GeomFromText('POINT(-71.064544 42.28787)') AS `pt`")
  )
  sedona_save_spatial_rdd(
    tbl \%>\% dplyr::mutate(id = 1),
    spatial_col = "pt",
    output_location = "/tmp/pts.wkb",
    output_format = "wkb"
  )
}

}
\seealso{
Other Sedona RDD data interface functions: 
\code{\link{sedona_read_dsv_to_typed_rdd}()},
\code{\link{sedona_read_geojson}()},
\code{\link{sedona_read_shapefile_to_typed_rdd}()},
\code{\link{sedona_write_wkb}()}
}
\concept{Sedona RDD data interface functions}
