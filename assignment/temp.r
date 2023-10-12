library(dagitty)
library(ggdag)
library(ggplot2)

dag <- dagitty("dag{y <- z -> x}")
tidy_dagitty(dag)
