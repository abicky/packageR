context("export")

test_that("`export` function should throw an error if called directly", {
    expect_error(export(), "`export` function should be called from `import` function")
})
