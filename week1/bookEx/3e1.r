p_grid <- seq( from=0 , to=1 , length.out=1000 ) 
prior <- rep( 1 , 1000 )
likelihood <- dbinom( 6 , size=9 , prob=p_grid )
posterior <- likelihood * prior
posterior <- posterior / sum(posterior)
set.seed(100)
samples <- sample( p_grid , prob=posterior , size=1e4 , replace=TRUE )

#3e1 = 0.0004
print(sum(samples < 0.2) / 1e4) 

#3e2 = 0.8884
print(sum(samples < 0.8) / 1e4) 

#3e4 = 0.51
print(quantile(samples, 0.2))

#3e5 = 0.75
print(quantile(samples, 0.8))

#3e6 = 0.50 - 0.77
print(quantile(samples, c(0.17, 0.83)))
