% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radiate.R
\name{od_radiation}
\alias{od_radiation}
\title{Function that estimates flow between points or zones using the radiation model}
\usage{
od_radiation(p, pop_var = "population", proportion = 1)
}
\arguments{
\item{p}{A SpatialPoints dataframe, the first column of which contains a unique ID}

\item{pop_var}{A character string representing the variable that corresponds
to the population of the zone or point}

\item{proportion}{A number representing the proportion of the population who
commute (1, the default, means 100 percent of the population commute to work)}
}
\description{
This is an implementation of the radiation model proposed in a paper
by Simini et al. (2012).
}
\examples{
# load some points data
data(cents)
# plot the points to check they make sense
plot(cents)
class(cents)
# Create test population to model flows
set.seed(2050)
cents$population <- runif(n = nrow(cents), min = 100, max = 1000)
# estimate
flowlines_radiation <- od_radiation(cents, pop_var = "population")
flowlines_radiation$flow
sum(flowlines_radiation$flow, na.rm = TRUE) # the total flow in the system
sum(cents$population) # the total inter-zonal flow
plot(flowlines_radiation, lwd = flowlines_radiation$flow / 100)
points(cents, cex = cents$population / 100)
}
\references{
Simini, F., Gonzalez, M.C., Maritan, A., Barabasi, A.L., 2012. A universal model for
mobility and migration patterns. Nature. doi:10.1038/nature10856
}

