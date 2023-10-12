library(rethinking)
N <- 300
a <- rnorm(N, 3, 1)
b <- rnorm(N, 2 , 0.5)

lambda <- exp(a + b)
print(mean(lambda))

dens(lambda)