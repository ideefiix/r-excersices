p_grid <- seq( from=0 , to=1 , length.out=100 )

likelihood <- dbinom( 5 , size=7 , prob=p_grid )
prior <- rep(1,100) # uniform prior
posterior <- likelihood * prior
posterior <- posterior / sum(posterior) # standardize

plot( posterior ~ p_grid , type="l" )