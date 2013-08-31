#' Export variables
#'
#' @param ... variales to be exported
#' @export
#' @examples
#' f <- function() print("function f")
#' # call `export` only in the imported scripts
#' \dontrun{export(f)}
export <- function(...) {
    ns <- parent.frame()
    if (identical(ns, globalenv()) || !isNamespace(ns) || environmentIsLocked(ns)) {
        stop("`export` function should be called from `import` function")
    }
    exports <- get(".__NAMESPACE__.", envir = ns)$exports

    names <- as.character(match.call(expand.dots = FALSE)$...)
    for (name in names) {
        if (!exists(name, ns, inherits = FALSE)) {
            stop(sprintf("`%s` is not found in namespace `%s`", name, getNamespaceName(ns)))
        }
        assign(name, name, exports)
    }
}
