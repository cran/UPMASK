\name{UPMASK-package}
\alias{UPMASK-package}
\alias{UPMASK}
\docType{package}
\title{
Unsupervised Photometric Membership Assignment in Stellar Clusters
}
\description{
An implementation of the UPMASK method for performing membership
    assignment in stellar clusters in R. It is prepared to use photometry and
    spatial positions, but it can take into account other types of data. The
    method is able to take into account arbitrary error models, and it is
    unsupervised, data-driven, physical-model-free and relies on as few
    assumptions as possible. The approach followed for membership assessment is
    based on an iterative process, principal component analysis, a clustering
    algorithm and a kernel density estimation.
}
\details{
\tabular{ll}{
Package: \tab UPMASK\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-09-11\cr
License: \tab GPL (>= 3)\cr
}

\if{html}{\figure{UPMASK-SimOC-Ex-Manual.jpg}{UPMASKexample}}
\if{latex}{\figure{UPMASK-SimOC-Ex-Manual.pdf}{options: width=5.3in}}

The two main functions in the \code{UPMASK} package are \code{\link{UPMASKfile}} and 
\code{\link{UPMASKdata}}. The later will run the \code{UPMASK} method on data inside a 
data frame, while the former will perform the analysis on a file (the later deals with 
loading a file inside a data frame, calling the \code{\link{UPMASKdata}} function and 
writing the results to an output file).

The package includes data from two simulated fields comprising simulated data from cluster and 
field stars -- to be used for demonstration. The analysis of these files using UPMASK lead 
to results presented in the figures above 
(from \href{http://dx.doi.org/10.1051/0004-6361/201321143}{Krone-Martins&Moitinho, 2014}),
 which show the spatial positions of the objects in the original datasets (in the left), 
 the same objects but color coded by membership probability after the \code{UPMASK} analysis 
 (in the center) and the color-magnitude diagram of all the stars also color coded by 
 membership probability (in the right).

}
\author{
Alberto Krone-Martins, Andre Moitinho

Maintainer: Alberto Krone-Martins <algol@sim.ul.pt>
}
\references{
\href{http://dx.doi.org/10.1051/0004-6361/201321143}{Krone-Martins, A. & Moitinho, A., Astronomy&Astrophysics, v.561, p.A57, 2014}
}

\keyword{ package }
\seealso{
  \code{\link{UPMASKfile}}, 
  \code{\link{UPMASKdata}} 
}
\examples{
\dontrun{
#
# Example of how to run UPMASK using data from a file
# Note: serious analysis require larger nRuns, and see UPMASKfile documentation 
# for the parametrization.
# Write a string with the filename of the input and output files
inputFileName <- system.file("extdata", 
             "oc_12_500_1000_1.0_p019_0880_1_25km_120nR_withcolors.dat", package="UPMASK")
outputFileName <- file.path(tempdir(), "RESULTS.dat")
# Run UPMASK
UPMASKfile(inputFileName, outputFileName, nRuns=5, starsPerClust_kmeans=25, 
          verbose=TRUE, fileWithHeader=TRUE)          
# Done, the results are written to the file outputFileName

#
# Example of how to run UPMASK using data from a data frame 
# Note: serious analysis require larger nRuns, and see UPMASKdata documentation 
# for the parametrization.
# Load the data into a data frame
inputFileName <- system.file("extdata", 
             "oc_12_5000_4000_4.0_p019_0900_1_15km_120nR_withcolors.dat", package="UPMASK")
ocData <- read.table(inputFileName, header=TRUE)
# Run UPMASK
upmaskRes <- UPMASKdata(ocData, nRuns=5, starsPerClust_kmeans=25, verbose=TRUE)
# Done, the results are in the data frame upmaskRes

# Clean the environment
rm(list=c("inputFileName","outputFileName","ocData","upmaskRes"))
}
}