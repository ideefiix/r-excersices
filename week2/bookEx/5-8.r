library(rethinking)
data(Howell1)
d <- Howell1

d$sex <- ifelse(d$male==1, 2 , 1)

m5.8 <- quap( 
    alist(
        height ~ dnorm( mu , sigma ) ,
        mu <- a[sex] ,
        a[sex] ~ dnorm( 170 , 20 ) ,
        sigma ~ dunif( 0 , 50 )
    ) , data=d )

post <- extract.samples(m5.8)
post$diff_fm <- post$a[,1] - post$a[,2]
#precis( post , depth=2 )