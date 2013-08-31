\name{export}
\alias{export}
\title{Export variables}
\usage{
  export(...)
}
\arguments{
  \item{...}{variales to be exported}
}
\description{
  Export variables
}
\examples{
f <- function() print("function f")
# call `export` only in the imported scripts
\dontrun{export(f)}
}

