all:

install:
	@R CMD INSTALL .

test:
	@Rscript --vanilla -e 'library(methods); devtools::test()'

check:
	@R CMD check .

doc:
	@Rscript --vanilla -e 'library(methods); devtools::document()'
