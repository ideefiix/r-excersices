library(rethinking)
library(rethinking)
data(Howell1)

d <- Howell1
d2 <- d[ d$age >= 18 , ]
# define the average weight, x-bar
xbar <- mean(d2$weight)
# fit model
m4.3 <- quap(
alist(height ~ dnorm( mu , sigma ) ,
mu <- a + b*( weight - xbar ) ,
a ~ dnorm( 178 , 20 ) ,
b ~ dlnorm( 0 , 1 ) ,
sigma ~ dunif( 0 , 50 )
) ,
data=d2 )

post <- extract.samples( m4.3 )
calc_height <- post$a + post$b * ( 46.95 - xbar )
print(round(PI( calc_height , prob=0.89 ), 2))
print(round(mean(calc_height), 2))

#Print density of the height value vector
#dens( calc_height , col=rangi2 , lwd=2 , xlab="mu|weight=50" )