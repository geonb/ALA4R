% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/specieslist.R
\name{specieslist}
\alias{specieslist}
\title{Get list of taxa and their occurrence counts}
\usage{
specieslist(taxon, wkt, fq)
}
\arguments{
\item{taxon}{string: (optional) query of the form field:value (e.g. "genus:Heleioporus") or a free text search (e.g. "macropodidae").
For reliable results it is recommended to use a specific field where possible (see \code{ala_fields("occurrence_indexed")}
for valid fields). It is also good practice to quote the taxon name if it contains multiple words, for example
\code{taxon="taxon_name:\"Alaba vibex\""} (noting, however, that multi-word names are unlikely in the context of a specieslist
search, where one would typically be searching for all species within, say, a genus or family)}

\item{wkt}{string: WKT (well-known text) defining a polygon within which to limit taxon search, e.g. "POLYGON((140 -37,151 -37,151 -26,140 -26,140 -37))"}

\item{fq}{string: character string or vector of strings, specifying filters to be applied to the original query. These are of the form "INDEXEDFIELD:VALUE" e.g. "kingdom:Fungi". See \code{ala_fields("occurrence_indexed", as_is=TRUE)} for all the fields that are queryable. NOTE that fq matches are case-sensitive, but sometimes the entries in the fields are not consistent in terms of case (e.g. kingdom names "Fungi" and "Plantae" but "ANIMALIA"). fq matches are ANDed by default (e.g. c("field1:abc", "field2:def") will match records that have field1 value "abc" and field2 value "def"). To obtain OR behaviour, use the form c("field1:abc OR field2:def")}
}
\value{
data frame of results, where each row is a taxon, its classification information, and its occurrence count
}
\description{
Retrieve a list of taxa matching a search query, within a spatial search area, or both.
}
\details{
NOTE March 2017: the response object might include records with missing taxonomic information. This is an issue with the ALA server-side systems; see https://github.com/AtlasOfLivingAustralia/bie-index/issues/134
}
\examples{
\dontrun{
x <- specieslist(taxon="genus:Hakea", wkt="POLYGON((145 -37,150 -37,150 -30,145 -30,145 -37))")

x <- specieslist(wkt="POLYGON((147.62 -42.83,147.60 -42.86,147.65 -42.87,147.70 -42.86,
  147.62 -42.83))", fq="rank:species")

x <- specieslist(wkt="POLYGON((145 -37,150 -37,150 -30,145 -30,145 -37))", fq="genus:Heleioporus")

x <- specieslist(wkt="POLYGON((152.38 -30.43,152.5 -30.43,152.5 -30.5,152.38 -30.5,152.38 -30.43))",
    fq="kingdom:Plantae")
## NOTE that this response might include records with empty or NA kingdom, phylum, or
##  class values, as per the note above.
}
}
\references{
Associated ALA web service: \url{https://api.ala.org.au/#ws106}

\url{http://www.geoapi.org/3.0/javadoc/org/opengis/referencing/doc-files/WKT.html}
}
\seealso{
\code{\link{ala_fields}} for occurrence fields that are queryable via the \code{fq} parameter
}
