library(rethinking)
# function to generate width data
sim_height <- function(W, b, sd) {
    U <- rnorm(length(W), 0, sd)
    H <- b * W + U
    return(H)
}

# Pretty bad. Because this is a uniform distribution
W <- runif(200, 40, 100)

H <- sim_height(W, 1, 10)

# plot(H ~ W, col=2, lwd=3)
dat <- list(W, H)
ex1 <- quap(
  alist(
    H ~ dnorm(mu, sigma),
    mu <- a + b*W,
    a ~ dnorm(0, 2),
    b ~ dnorm(0, 2),
    sigma ~ dnorm(0, 2)
  ),
    data = dat
)
precis(ex1)