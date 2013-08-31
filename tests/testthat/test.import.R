context("import")

test_that("`import` function should import multiple script to the specified namespace", {
    name <- "foo"
    files <- system.file("examples", c("public.R", "private.R"), package = "packageR")
    import(files, name)
    on.exit(rm(list = name, envir = namespace:::.getNameSpaceRegistry()))
    expect_equivalent(foo::f(), "f")
    expect_equivalent(foo::g(), "g")
    expect_equivalent(foo::v, "public variable")
    expect_error(foo::.f, "not an exported object")
    expect_error(foo::.g, "not an exported object")
    expect_error(foo::.v, "not an exported object")
    expect_equivalent(foo:::.f(), ".f")
    expect_equivalent(foo:::.g(), ".g")
    expect_equivalent(foo:::.v, "private variable")
})

test_that("`import` function should not overide the namespaces of installed packages", {
    expect_error(import("dummy", "MASS"), "package '.+?' exists")
})
