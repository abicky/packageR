#' Import R scripts as a package
#'
#' @param files R scripts to be imported
#' @param as name of the namespace where the variables in the scripts will be defined
#' @export
#' @examples
#' files <- system.file("examples", c("public.R", "private.R"), package = "packageR")
#' import(files, "foo")
#' # exported function
#' foo::f()
#' # unexported function
#' foo:::.f()
#' unloadNamespace("foo")
import <- function(files, as) {
    if (length(find.package(as, quiet = TRUE))) {
        stop(sprintf("package '%s' exists", as))
    }
    ns <- namespace::makeNamespace(as)
    for (file in files) {
        res <- try(sys.source(file, ns))
        if (inherits(res, "try-error")) {
            unloadNamespace(as)
        }
    }
    setPackageName(as, ns)
    lockEnvironment(ns)
}
