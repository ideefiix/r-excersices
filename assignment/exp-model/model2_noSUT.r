library(rethinking)

d <- read.csv(file = "C:\\Users\\flind\\Desktop\\empirical-course\\r-excersices\\assignment\\assignmentdata.csv", sep = ";")

dat_list <- list(
    F = d$fmeasure,
    tech_id = rep(1:6, 12) 
)

m1 <- ulam(
alist(
F ~ dexp(lambda),
log(lambda) <- a[tech_id],
a[tech_id] ~ dnorm(3 , 1)
), data=dat_list , chains=4 , cores=4, log_lik=TRUE
)



#For posterior check

#precis(m1, depth=2) But what is rhat? And why is it gone?

#Show a diagram of each tech prediction on the outcome scale

#post <- extract.samples(m1)
#techs <- exp(post$a)
#suts <- exp(post$b)
#plot( precis( as.data.frame(1/techs) ) , xlim=c(0,5000) )
#plot( precis( as.data.frame(1/suts) ) , xlim=c(0,5000) )

#tech1_mean <- mean(post$a[,1])
#sut1_mean <- mean(post$b[,1])
#1/exp(tech1_mean + sut1_mean) -> the mean of tech1 on sut1

#for laptop
#d <- read.csv(file = "C:\\Users\\flind\\Desktop\\r-folder\\assignment\\assignmentdata.csv", sep = ";")