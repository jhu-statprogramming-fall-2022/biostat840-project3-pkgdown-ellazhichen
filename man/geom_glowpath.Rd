% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom-glowpath.r
\name{geom_glowpath}
\alias{geom_glowpath}
\alias{geom_glowline}
\alias{geom_glowstep}
\title{Connect Observations}
\usage{
geom_glowpath(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  ...,
  lineend = "butt",
  linejoin = "round",
  linemitre = 10,
  arrow = NULL,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)

geom_glowline(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  na.rm = FALSE,
  orientation = NA,
  show.legend = NA,
  inherit.aes = TRUE,
  ...
)

geom_glowstep(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  direction = "hv",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  ...
)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by [aes()] or
[aes_()]. If specified and `inherit.aes = TRUE` (the
default), it is combined with the default mapping at the top level of the
plot. You must supply `mapping` if there is no plot mapping.}

\item{data}{The data to be displayed in this layer. There are three
   options:

   If `NULL`, the default, the data is inherited from the plot
   data as specified in the call to [ggplot()].

   A `data.frame`, or other object, will override the plot
   data. All objects will be fortified to produce a data frame. See
   [fortify()] for which variables will be created.

   A `function` will be called with a single argument,
   the plot data. The return value must be a `data.frame`, and
   will be used as the layer data. A `function` can be created
   from a `formula` (e.g. `~ head(.x, 10)`).}

\item{stat}{The statistical transformation to use on the data for this
layer, as a string.}

\item{position}{Position adjustment, either as a string, or the result of
a call to a position adjustment function.}

\item{...}{Other arguments passed on to [layer()]. These are
often aesthetics, used to set an aesthetic to a fixed value, like
`colour = "red"` or `size = 3`. They may also be parameters
to the paired geom/stat.}

\item{lineend}{Line end style (round, butt, square).}

\item{linejoin}{Line join style (round, mitre, bevel).}

\item{linemitre}{Line mitre limit (number greater than 1).}

\item{arrow}{Arrow specification, as created by [grid::arrow()].}

\item{na.rm}{If `FALSE`, the default, missing values are removed with
a warning. If `TRUE`, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
`NA`, the default, includes if any aesthetics are mapped.
`FALSE` never includes, and `TRUE` always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If `FALSE`, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. [borders()].}

\item{orientation}{The orientation of the layer. The default (`NA`)
automatically determines the orientation from the aesthetic mapping. In the
rare event that this fails it can be given explicitly by setting `orientation`
to either `"x"` or `"y"`. See the *Orientation* section for more detail.}

\item{direction}{direction of stairs: 'vh' for vertical then horizontal,
'hv' for horizontal then vertical, or 'mid' for step half-way between
adjacent x-values.}
}
\value{
a `ggplot2` layer to add to a plot.
}
\description{
Plot a glow beneath the connected lines to make it easier to read a chart with several
overlapping observations. `geom_glowpath()` connects the observations in the order in which they appear
in the data. `geom_glowline()` connects them in order of the variable on the
x axis. `geom_glowstep()` creates a stairstep plot, highlighting exactly
when changes occur.
}
\details{
The `group` aesthetic determines which cases are
connected together. These functions are designed as a straight replacement
to the [geom_path()], [geom_line()] and [geom_step()] functions.
To set the order of drawing, make the `colour` aesthetic a factor, and set the order
from bottom to top.
}
\section{Functions}{
\itemize{
\item \code{geom_glowpath()}: Connects observations in the order in which they appear in the data.

\item \code{geom_glowline()}: Connects observations in order of the variable on the x axis.

\item \code{geom_glowstep()}: Creates a stairstep plot, highlighting exactly when changes occur.

}}
\section{Missing value handling}{

`geom_glowpath()`, `geom_glowline()`, and `geom_glowstep()` handle `NA` as follows:

*  If an `NA` occurs in the middle of a line, it breaks the line. No warning
   is shown, regardless of whether `na.rm` is `TRUE` or `FALSE`.
*  If an `NA` occurs at the start or the end of the line and `na.rm` is `FALSE`
   (default), the `NA` is removed with a warning.
*  If an `NA` occurs at the start or the end of the line and `na.rm` is `TRUE`,
   the `NA` is removed silently, without warning.
}

\section{Aesthetics}{

Adds 3 new aesthetics to [geom_path()]:
* \code{shadowcolour} defaults to path color, controls the color of the shadow.
* \code{shadowsize} defaults to \code{size}, controls the size of the shadow.
* \code{shadowalpha} defaults to \code{0.06 * alpha} or \code{0.06}, controls the alpha of the glow.
}

\examples{
# geom_glowline() is suitable for time series
library(ggplot2)
ggplot(economics_long, aes(date, value01, colour = variable)) + geom_glowline()


}
\seealso{
[ggplot::geom_path()], [ggplot::geom_line()], [ggplot::geom_step()]: Filled paths (polygons);
}
