% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_interface.R
\name{sedona_spatial_rdd_data_source}
\alias{sedona_spatial_rdd_data_source}
\title{Create a SpatialRDD from an external data source.}
\arguments{
\item{sc}{A \code{spark_connection}.}

\item{location}{Location of the data source.}

\item{type}{Type of the SpatialRDD (must be one of "point", "polygon", or
"linestring".}

\item{has_non_spatial_attrs}{Whether the input contains non-spatial
attributes.}

\item{storage_level}{Storage level of the RDD (default: MEMORY_ONLY).}

\item{repartition}{The minimum number of partitions to have in the resulting
RDD (default: 1).}
}
\description{
Import spatial object from an external data source into a Sedona SpatialRDD.
}
\keyword{internal}
