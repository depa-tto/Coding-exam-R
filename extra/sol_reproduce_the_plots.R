library(ggplot2)

# 1
ggplot(mpg,aes(displ,hwy)) + 
  geom_point() +
  geom_smooth(se = F)

#2
ggplot(mpg,aes(displ,hwy)) + 
  geom_point() +
  geom_smooth(aes(group=drv),se = F)


#3
ggplot(mpg,aes(displ,hwy, col=drv)) + 
  geom_point() +
  geom_smooth(aes(),se = F)


#4
ggplot(mpg,aes(displ,hwy)) + 
  geom_point(aes(col=drv)) +
  geom_smooth(aes(),se = F)

#5
ggplot(mpg,aes(displ,hwy)) + 
  geom_point(aes(col=drv)) +
  geom_smooth(aes(lty=drv),se = F)

#6
ggplot(mpg,aes(displ,hwy)) + 
  geom_point(col="white",size=4) +
  geom_point(aes(col=drv)) 
  

