# s.85

#4m1
library(rethinking)
sample_my <- rnorm(1000 , 0 , 10)
sample_sigma <- rexp(1000, 1)
sample_prior <- rnorm(1000 , sample_my , sample_sigma)
dens(sample_prior)

#done?
quap(
    alist(
        sample_prior ~ rnorm(1000 , sample_my , sample_sigma),
        sample_my ~ rnorm(1000 , 0 , 10),
        sample_sigma ~ rexp(1000, 1)
    )
)