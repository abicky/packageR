f <- function() {
    return("f")
}

g <- function() {
    return("g")
}

v <- "public variable"

export(f, g, v)
