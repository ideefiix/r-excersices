library(rethinking) 
data(reedfrogs)
d <- reedfrogs

# make the tank cluster variable
d$tank <- 1:nrow(d)
dat <- list(
S = d$surv,
N = d$density,
tank = d$tank )
# approximate posterior
m13.1 <- ulam(
alist(
S ~ dbinom( N , p ) ,
logit(p) <- a[tank] ,
a[tank] ~ dnorm( 0 , 1.5 )
), data=dat , chains=4 , log_lik=TRUE )