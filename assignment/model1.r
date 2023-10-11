library(rethinking)

d <- read.csv(file = "C:\\Users\\flind\\Desktop\\empirical-course\\r-excersices\\assignment\\assignmentdata.csv", sep = ";")

dat_list <- list(
    F = d$fmeasure,
    sut_id = rep(1:12, each=6),
    tech_id = rep(1:6, 12) 
)

m1 <- ulam(
alist(
F ~ dpois(lambda),
log(lambda) <- a[tech_id] + b[sut_id],
a[tech_id] ~ dnorm(5 , 2),
b[sut_id] ~ dnorm(3 , 2)
), data=dat_list , chains=4 , cores=4
)

post <- extract.samples(m1)
sut_effect <- exp( prior$b )
plot( precis( as.data.frame(sut_effect) ) , xlim=c(0,600) )

# Mean 1135 fmeasure -> tech
#a <- rnorm(1e4,5,2)
#lambda <- exp(a)
#mean( lambda )

# Mean 160 fmeasure -> sut
#a <- rnorm(1e4,3,2)
#lambda <- exp(a)
#mean( lambda )

#tech_predict_check <- rnorm(1e4,5,2)
#sut_predict_check <- rnorm(1e4,3,2)


#curve( dlnorm( x , 5 , 2 ) , from=0 , to=100 , n=200 )


#m11.7 <- ulam(
    #alist(
      #  awards ~ dbinom(applications, p),
      #  logit(p) <- a[gid] + b[dept_id],
       #  a[gid] ~ dnorm(0, 1.5),
        # b[dept_id] ~ dnorm(0, 1.5)
    #), data=dat_list, chains = 4 , iter=4000
#)

# min
#[1] 299.835
#> max(d$fmeasure)
#[1] 3491.867

