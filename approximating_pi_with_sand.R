## Fix the seed of the pseudo-random generator of R
set.seed(321)

nsim <- 1000

##  We simulate nsim observations from a uniform distribution
##  on the square [-1,1]x[-1,1].
### These values represent the coordinate where the grains fall in the square

x_coord <- runif(nsim,-1,1)
y_coord <- runif(nsim,-1,1)

df_grains <- cbind(x_coord,y_coord)

### Let's give a look at our square with the thrown sand

### Plot the square

## first draw an empty graph
plot(c(0,0),xlim=c(-1.2,1.2),ylim=c(-1.2,1.2),type="n", asp=1)
## plot the square
segments(x0 = -1,y0 = 1,x1 = 1,y1 = 1,lwd=2)
segments(-1,-1,-1,1,lwd=2)
segments(-1,-1,1,-1,lwd=2)
segments(1,-1,1,1,lwd=2)

##### plot the circle 
### we will use polar coordinate 
tt <- seq(0,2*pi,length=200)
lines(sin(tt),cos(tt),col="red",lwd=2)



## We trow the sand
points(df_grains,col="blue",pch=20,cex=1)

# We can redraw the circle if needed
lines(sin(tt),cos(tt),col="red",lwd=2)

### How many grains of sand fall in the circle with center in (0,0) and radius 1?
# These are those points whose distance from the center is smaller or equal than 1

## First we compute the distance of each point from the origin
dist_from_center <- apply(df_grains, MARGIN = 1,FUN = function(grain_coord) sqrt(grain_coord[1]^2+grain_coord[2]^2)) # alternatively: check the norm function

## Which are the grains that fall inside the circle?
ind_in_the_circle <- which(dist_from_center<=1)

#how many grains fall inside the circle?
n_inside <- length(ind_in_the_circle)
### Let's take a look
## the grains inside the circle
points(df_grains[ind_in_the_circle,],col="red",pch=20)

# Let's approximate the ratio between the areas of the square and circle
A_circle_over_A_square <- n_inside/nsim

l_square <- 2
A_square <- 2^2
simulated_pi <- A_circle_over_A_square*A_square
print(simulated_pi)
