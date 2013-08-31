\name{import}
\alias{import}
\title{Import R scripts as a package}
\usage{
  import(files, as)
}
\arguments{
  \item{files}{R scripts to be imported}

  \item{as}{name of the namespace where the variables in
  the scripts will be defined}
}
\description{
  Import R scripts as a package
}
\examples{
files <- system.file("examples", c("public.R", "private.R"), package = "packageR")
import(files, "foo")
# exported function
foo::f()
# unexported function
foo:::.f()
unloadNamespace("foo")
}

