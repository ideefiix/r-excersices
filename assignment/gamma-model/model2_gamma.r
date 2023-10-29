library(rethinking)

d <- read.csv(file = "C:\\Users\\flind\\Desktop\\empirical-course\\r-excersices\\assignment\\assignmentdata.csv", sep = ";")

dat_list <- list(
    F = d$fmeasure,
    sut_id = rep(1:12, each=6),
    tech_id = rep(1:6, 12) 
)

m1 <- ulam(
alist(
F ~ gamma(a, b),
log(a) <- a_rate[tech_id] + b_rate[sut_id],
log(b) <- a_shape[tech_id] + b_shape[sut_id],
a_shape[tech_id] ~ dnorm(3 , 1),
b_shape[sut_id] ~ dnorm(3 , 1),
a_rate[tech_id] ~ dnorm(2 , 0.5),
b_rate[sut_id] ~ dnorm(2 , 0.5)
), data=dat_list , chains=4 , cores=4, log_lik=TRUE
)