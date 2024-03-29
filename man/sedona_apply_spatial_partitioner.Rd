% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spatial_partitioner.R
\name{sedona_apply_spatial_partitioner}
\alias{sedona_apply_spatial_partitioner}
\title{Apply a spatial partitioner to a Sedona spatial RDD.}
\usage{
sedona_apply_spatial_partitioner(
  rdd,
  partitioner = c("quadtree", "kdbtree"),
  max_levels = NULL
)
}
\arguments{
\item{rdd}{The spatial RDD to be partitioned.}

\item{partitioner}{The name of a grid type to use (currently "quadtree" and
"kdbtree" are supported) or an
\code{org.apache.sedona.core.spatialPartitioning.SpatialPartitioner} JVM
object. The latter option is only relevant for advanced use cases involving
a custom spatial partitioner.}

\item{max_levels}{Maximum number of levels in the partitioning tree data
structure. If NULL (default), then use the current number of partitions
within \code{rdd} as maximum number of levels.
Specifying \code{max_levels} is unsupported for use cases involving a
custom spatial partitioner because in these scenarios the partitioner
object already has its own maximum number of levels set and there is no
well-defined way to override this existing setting in the partitioning
data structure.}
}
\value{
A spatially partitioned SpatialRDD.
}
\description{
Given a Sedona spatial RDD, partition its content using a spatial
partitioner.
}
\examples{
library(sparklyr)
library(apache.sedona)

sc <- spark_connect(master = "spark://HOST:PORT")

if (!inherits(sc, "test_connection")) {
  input_location <- "/dev/null" # replace it with the path to your input file
  rdd <- sedona_read_dsv_to_typed_rdd(
    sc,
    location = input_location,
    delimiter = ",",
    type = "point",
    first_spatial_col_index = 1L
  )
  sedona_apply_spatial_partitioner(rdd, partitioner = "kdbtree")
}

}
