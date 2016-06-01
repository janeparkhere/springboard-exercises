install.packages("ggplot2")
library(ggplot2)

#when you're making a plot, you're 
#trying to map an aspect
#of the data onto a drawing
#every single plot is made up of the
#data you want to plot
#the most simple graphs are like:

ggplot(mtcars) +
  aes(x = mpg, colour=gear) +
  geom_histogram()

ggplot(mtcars) +
  aes(x = mpg, y = hp, colour=gear, size = cyl) +
  geom_point()

ggplot(mtcars) +
  aes(x=mpg,y=hp, colour=gear) + #color by gear
  geom_line()

?aes

ggplot(mtcars) +
  aes(x=gear,fill=vs) +
  geom_bar()


?ggplot

