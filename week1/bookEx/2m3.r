# The probability of earth when seeing land

p_grid <- seq(from=0, to=1, length.out=20)
prior <- ifelse(p_grid > 0.5, 1 , 0.3) # probability of getting land

likelihood <- dbinom(1 , 1 , prob=p_grid) #we got land

unstd.post <- prior * likelihood
post <- unstd.post / sum(unstd.post) 

plot( p_grid , post , type="b" ,
xlab="probability of water" , ylab="posterior probability" )
mtext( "30 points" )
print(precis(post))

#Gave up.