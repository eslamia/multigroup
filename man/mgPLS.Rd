% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/mgPLS.R
\name{mgPLS}
\alias{mgPLS}
\title{Multigroup Partial Least Squares Regression}
\usage{
mgPLS(DataX, DataY, Group, ncomp = NULL, Scale = FALSE, Gcenter = FALSE,
  Gscale = FALSE)
}
\arguments{
\item{DataX}{a numeric matrix or data frame associated with independent dataset}

\item{DataY}{a numeric matrix or data frame associated with dependent dataset}

\item{Group}{a vector of factors associated with group structure}

\item{ncomp}{number of components, if NULL number of components is equal to 2}

\item{Scale}{scaling variables, by defalt is FALSE. By default data are centered within groups}

\item{Gcenter}{global variables centering, by defalt is FALSE.}

\item{Gscale}{global variables scaling, by defalt is FALSE.}
}
\value{
list with the following results:

\item{DataXm}{Group X  data}

\item{DataYm}{Group Y  data}

\item{Concat.X}{Concatenated X data}

\item{Concat.Y}{Concatenated Y data}

\item{coefficients}{Coefficients associated with  X data}

\item{coefficients.Y}{Coefficients associated with regressing  Y on Global components X}

\item{Components.Global}{Conctenated Components for X and Y}

\item{Components.Group}{Components associated with groups in X}

\item{loadings.common}{Common vector of loadings for X and Y}

\item{loadings.Group}{Group vector of loadings for X and Y}

\item{expvar}{Explained variance associated with global components X}

\item{cum.expvar.Group}{Cumulative explained varaince in groups of X and Y}

\item{Similarity.Common.Group.load}{Cumulative similarity between group and common loadings}

\item{Similarity.noncum.Common.Group.load}{ NonCumulative  similarity between group and common loadings}

\item{eigenValue}{EigenValue to calculate the percentage of inertia}

\item{Percentage.inertia.per.GroupX}{Percentages of inertia per group X}
}
\description{
Multigroup PLS regression
}
\examples{
data(oliveoil)
DataX = oliveoil[,2:6]
DataY = oliveoil[,7:12]
Group = as.factor(oliveoil[,1])
res.mgPLS = mgPLS (DataX, DataY, Group)
barplot(res.mgPLS$noncumper.inertiglobal)
#----- Regression coefficients
#res.mgPLS$coefficients[[2]]
#----- Similarity index: group loadings are compared to the common structure (in  X and Y spaces)
XX1= res.mgPLS$Similarity.noncum.Common.Group.load$X[[1]][-1, 1, drop=FALSE]
XX2=res.mgPLS$Similarity.noncum.Common.Group.load$X[[2]][-1, 1, drop=FALSE]
simX <- cbind(XX1, XX2)
YY1=res.mgPLS$Similarity.noncum.Common.Group.load$Y[[1]][-1, 1, drop=FALSE]
YY2=res.mgPLS$Similarity.noncum.Common.Group.load$Y[[2]][-1, 1, drop=FALSE]
simY <- cbind(YY1,YY2)
XLAB = paste("Dim1, \%",res.mgPLS$noncumper.inertiglobal[1])
YLAB = paste("Dim1, \%",res.mgPLS$noncumper.inertiglobal[2])
plot(simX[, 1], simX[, 2], pch=15, xlim=c(0, 1), ylim=c(0, 1), main="Similarity indices in X space",
     xlab=XLAB, ylab=YLAB)
abline(h=seq(0, 1, by=0.2), col="black", lty=3)
text(simX[, 1], simX[, 2], labels=rownames(simX), pos=2)
plot(simY[, 1], simY[, 2], pch=15, xlim=c(0, 1), ylim=c(0, 1), main="Similarity indices in Y space",
     xlab=XLAB, ylab=YLAB)
abline(h=seq(0, 1, by=0.2), col="black", lty=3)
text(simY[, 1], simY[, 2], labels=rownames(simY), pos=2)
}
\references{
A. Eslami, E. M. Qannari, A. Kohler and S. Bougeard (2013). Multi-group PLS
regressMathematics and Statistics, Springer Proceedings (ed), \emph{New Perspectives
in Partial Least Squares and Related Methods}, 56, 243-255.

A. Eslami, E. M. Qannari, A. Kohler and S. Bougeard (2014). Algorithms
 for multi-group PLS. \emph{Journal of Chemometrics}, 28(3), 192-201.
}
\seealso{
\code{\link{mgPCA}}, \code{\link{mbmgPCA}}
}

