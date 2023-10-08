d <- read.csv ("https://torkar.github.io/data-RBS.csv")
str(d) # check format
# make to a list so we can add alpha below
d <- as.list(d)
# add alpha values for Dirichlet
d$alpha <- c(2 ,2 ,2)
library(rethinking)


