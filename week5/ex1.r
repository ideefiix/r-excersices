library(rethinking)
data(NWOGrants)

d <- NWOGrants
# The direct casual effect on award from gender is very low
# Males have 2% higher chance of getting an award

dat_list <- list(
awards = d$awards,
applications = d$applications,
gid = ifelse( d$gender=="m" , 1 , 2 )
)

dat_list$dept_id <- rep(1:9,each=2)
m11.7 <- ulam(
    alist(
        awards ~ dbinom(applications, p),
        logit(p) <- a[gid] + b[dept_id],
         a[gid] ~ dnorm(0, 1.5),
         b[dept_id] ~ dnorm(0, 1.5)
    ), data=dat_list, chains = 4 , iter=4000
)

post <- extract.samples(m11.7)
p_diff <- inv_logit(post$a[,1]) - inv_logit(post$a[,2]) 
