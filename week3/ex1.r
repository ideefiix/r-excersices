p1 <- c( 0.2 , 0.2 , 0.2 , 0.2 , 0.2 )
island1_entropy = -sum( p1*log(p1) )
print(island1_entropy)

p2 <- c( 0.8 , 0.1 , 0.05 , 0.025 , 0.025 )
island2_entropy = -sum( p2*log(p2) )
print(island2_entropy)

p3 <- c( 0.05 , 0.15 , 0.7 , 0.05 , 0.05 )
island3_entropy = -sum( p3*log(p3) )
print(island3_entropy)

print("Divergents from the first island")
island1_to_2_divergent = sum(p2 * log(p2/p1))
print(island1_to_2_divergent)

island1_to_3_divergent = sum(p3 * log(p3/p1))
print(island1_to_3_divergent)


print("Divergents from the second island")
island2_to_1_divergent = sum(p1 * log(p1/p2))
print(island2_to_1_divergent)

island2_to_3_divergent = sum(p3 * log(p3/p2))
print(island2_to_3_divergent)

print("Divergents from the third island")
island3_to_1_divergent = sum(p1 * log(p1/p3))
print(island3_to_1_divergent)

island3_to_2_divergent = sum(p2 * log(p2/p3))
print(island3_to_2_divergent)