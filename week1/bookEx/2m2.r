# 5 water 2 land

p_grid <- seq(from=0, to=1, length.out=30)
prior <- ifelse(p_grid > 0.5, 0.7, 0)
likelihood <- dbinom(5 , 7 , prob=p_grid)

unstd.post <- prior * likelihood
post <- unstd.post / sum(unstd.post) 

plot( p_grid , post , type="b" ,
xlab="probability of water" , ylab="posterior probability" )
mtext( "30 points" )
print(precis(post))