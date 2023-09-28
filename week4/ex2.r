library(rethinking)
data(Wines2012)
d <- Wines2012
dat_list <- list(
S = standardize(d$score),
jid = as.integer(d$judge),
wid = as.integer(d$wine)
)

dat_list2 <- list(
S = standardize(d$score),
W = d$wine.amer,
J = d$judge.amer,
R = ifelse(d$flight=="red",1L,0L)
)

m2a <- ulam(
alist(
S ~ dnorm( mu , sigma ),
mu <- a + bW*W + bJ*J + bR*R,
a ~ dnorm( 0 , 0.2 ),
c(bW,bJ,bR) ~ dnorm( 0 , 0.5 ),
sigma ~ dexp(1)
), data=dat_list2 , chains=4 , cores=4
)
precis( m2a )
