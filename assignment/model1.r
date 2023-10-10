library(rethinking)

d <- read.csv(file = "C:\\Users\\flind\\Desktop\\empirical-course\\r-excersices\\assignment\\assignmentdata.csv", sep = ";")

dat_list <- list(
    F = standardize(d$fmeasure),
    sut_id = rep(1:12, each=6),
    tech_id = rep(1:6, 12) 
)

m1 <- ulam(
alist(
F ~ dpois(lambda),
log(lambda) <- a[tech_id] + b[sut_id],
a[tech_id] ~ dnorm( 0 , 0.5 ),
b[sut_id] ~ dnorm( 0 , 0.5 )
), data=dat_list , chains=4 , cores=4
)


#m11.7 <- ulam(
    #alist(
      #  awards ~ dbinom(applications, p),
      #  logit(p) <- a[gid] + b[dept_id],
       #  a[gid] ~ dnorm(0, 1.5),
        # b[dept_id] ~ dnorm(0, 1.5)
    #), data=dat_list, chains = 4 , iter=4000
#)