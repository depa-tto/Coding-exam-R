library(ggplot2)

# 1
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) + 
  geom_point() +
  geom_smooth(se = FALSE)

# 1.1
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) + 
  geom_point() +
  geom_smooth(se = TRUE)

# 2
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) + 
  geom_point() +
  geom_smooth(mapping=aes(group=drv),se = F)

# 2.2
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) + 
  geom_point() +
  geom_smooth(mapping=aes(lty=drv),se = F)

# 3
ggplot(data=mpg, mapping=aes(x=displ, y=hwy, col=drv)) + 
  geom_point() +
  geom_smooth(mapping=aes(),se = FALSE)


# 4
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) + 
  geom_point(mapping=aes(col=drv)) +
  geom_smooth(mapping=aes(),se = F)

# 5
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) + 
  geom_point(mapping=aes(col=drv)) +
  geom_smooth(mapping=aes(lty=drv),se = F)

# 6
ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) + 
  geom_point(mapping=aes(),col="white",size=4) +
  geom_point(mapping=aes(col=drv)) +
  geom_smooth(mapping=aes(lty=drv),se=F)
  


