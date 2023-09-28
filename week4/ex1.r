library(rethinking)
data(Wines2012)
d <- Wines2012
dat_list <- list(
S = standardize(d$score),
jid = as.integer(d$judge),
wid = as.integer(d$wine)
)

m1 <- ulam(
alist(
S ~ dnorm( mu , sigma ),
mu <- a[jid] + w[wid],
a[jid] ~ dnorm(0,0.5),
w[wid] ~ dnorm(0,0.5),
sigma ~ dexp(1)
), data=dat_list , chains=4 , cores=4 )

plot(precis(m1 , 2))