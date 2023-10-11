#prior <- extract.prior(m1)
#tech_effect <- exp( prior$b )
#plot( precis( as.data.frame(tech_effect) ) , xlim=c(0,600) )

# Does not help...

#set.seed(100) 
#N <- 100
#a <- rnorm( N , 5, 2 )
#b <- rnorm( N , 3, 2 )

#plot( NULL , xlim=c(-2,2) , ylim=c(0,1000) )
#for ( i in 1:N ) curve( exp( a[i] + b[i]*x ) , add=TRUE , col=grau() )

# Mean 1135 fmeasure -> tech
#a <- rnorm(1e4,5,2)
#lambda <- exp(a)
#mean( lambda )

# Mean 160 fmeasure -> sut
#a <- rnorm(1e4,3,2)
#lambda <- exp(a)
#mean( lambda )