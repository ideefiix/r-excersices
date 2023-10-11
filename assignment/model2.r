library(rethinking)

d <- read.csv(file = "C:\\Users\\flind\\Desktop\\r-folder\\assignment\\assignmentdata.csv", sep = ";")
#d <- read.csv(file = "C:\\Users\\flind\\Desktop\\empirical-course\\r-excersices\\assignment\\assignmentdata.csv", sep = ";")

dat_list <- list(
    F = d$fmeasure,
    sut_id = rep(1:12, each=6),
    tech_id = rep(1:6, 12) 
)

m1 <- ulam(
alist(
F ~ dexp(lambda),
log(lambda) <- a[tech_id] + b[sut_id],
a[tech_id] ~ dnorm(5 , 2),
b[sut_id] ~ dnorm(3 , 2)
), data=dat_list , chains=4 , cores=4
)

#post <- extract.samples(m1)
#sut_effect <- exp(post$b)
#tech_effect <- exp(post$a)

prior <- exp(extract.prior( m1 ))
xseq <- c(0,5000)
mu <- link( m5.5_draft , post=prior , data=list(N=xseq) )
plot( NULL , xlim=xseq , ylim=xseq )
for ( i in 1:50 ) lines( xseq , mu[i,] , col=col.alpha("black",0.3) )
