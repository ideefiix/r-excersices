library(rethinking)
N <- 300
a <- rnorm(N, 5, 2)
b <- rnorm(N, 3 , 2)

lambda <- exp(a + b)

xseq <- c(0,5000)
mu <- link( m5.5_draft , post=lambda , data=list(N=xseq) )
plot( NULL , xlim=xseq , ylim=xseq )
for ( i in 1:50 ) lines( xseq , mu[i,] , col=col.alpha("black",0.3)