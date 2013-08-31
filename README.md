packageR -- Import R scripts as a package
=========================================

Description
-----------

This package provides a mechanism to import R scripts as a package, in other words, with namespace.


Installation
------------

First, install `namespace` package used in `packageR`.

    $ Rscript -e 'install.packages("namespace")'

Then, clone the repository and install the package.

    $ git clone git@github.com:abicky/packageR.git
    $ R CMD INSTALL packageR


Usage
-----

    import(files, as)

See also `?import`

You have to call `export` function to export the variables in the specified scripts like below:

    f <- function() print("function f")
    export(f)


Examples
--------

    files <- system.file("examples", c("public.R", "private.R"), package = "packageR")
    import(files, "foo")
    # exported function
    foo::f()
    # unexported function
    foo:::.f()
    unloadNamespace("foo")
