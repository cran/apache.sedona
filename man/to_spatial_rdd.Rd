% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spatial_rdd.R
\name{to_spatial_rdd}
\alias{to_spatial_rdd}
\title{Export a Spark SQL query with a spatial column into a Sedona spatial RDD.}
\usage{
to_spatial_rdd(x, spatial_col)
}
\arguments{
\item{x}{A Spark dataframe object in sparklyr or a dplyr expression
representing a Spark SQL query.}

\item{spatial_col}{The name of the spatial column.}
}
\value{
A SpatialRDD encapsulating the query.
}
\description{
Given a Spark dataframe object or a dplyr expression encapsulating a Spark
SQL query, build a Sedona spatial RDD that will encapsulate the same query or
data source. The input should contain exactly one spatial column and all
other non-spatial columns will be treated as custom user-defined attributes
in the resulting spatial RDD.
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
  rdd <- to_spatial_rdd(tbl, "pt")
}

}
