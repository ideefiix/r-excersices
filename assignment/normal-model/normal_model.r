library(rethinking)

d <- read.csv(file = "C:\\Users\\flind\\Desktop\\empirical-course\\r-excersices\\assignment\\assignmentdata.csv", sep = ";")

dat_list <- list(
    F = d$fmeasure,
    sut_id = rep(1:12, each=6),
    tech_id = rep(1:6, 12) 
)

m1 <- ulam(
alist(
S ~ dnorm( mu , sigma ),
mu <- a[tech_id] + b[sut_id],
a[tech_id] ~ dnorm(1000, 20),
b[sut_id] ~ dnorm(1000, 10),
sigma ~ dexp(1)
), data=dat_list , chains=4 , cores=4 )