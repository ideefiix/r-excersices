library(rethinking)
# Get 3 water

#p_grid <- seq(from=0, to=1, length.out=30)
#prior <- rep(0.5, 30)
#likelihood <- dbinom(3 , 3 , prob=p_grid)

#unstd.post <- prior * likelihood
#post <- unstd.post / sum(unstd.post) 

#plot( p_grid , post , type="b" ,
#xlab="probability of water" , ylab="posterior probability" )
#mtext( "30 points" )
#print(precis(post))

# 3 water 1 land

# 5 water 2 land

p_grid <- seq(from=0, to=1, length.out=30)
prior <- rep(0.5, 30)
likelihood <- dbinom(5 , 7 , prob=p_grid)

unstd.post <- prior * likelihood
post <- unstd.post / sum(unstd.post) 

plot( p_grid , post , type="b" ,
xlab="probability of water" , ylab="posterior probability" )
mtext( "30 points" )
print(precis(post))