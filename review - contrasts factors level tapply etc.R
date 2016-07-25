# example from website to help understand contrasts, levels, factors, etc. ==> www.clayford.net/statistics/tag/helmert-contasts/

set.seed(2112)

#create 3 levels, 10 each
flevels <- factor(rep(c("A","B","c"),c(10,10,10)))
flevels

#create some "nice" data, sorted so means at each level have some good separation
?sort
?round
?runif
vals <-sort(round(runif(30,3,15)))
vals

#calculate mean of each level for reference
means <- tapply(vals,flevels,mean)

?tapply
?mean
means

## verify the default unordered contrast setting is the Treatment contrast

options("contrasts")
?options

# returns:
  # $contrasts
          # unordered           ordered 
  # "contr.treatment"      "contr.poly"
# this means our factor levels are coded as follows:

contrasts(flevels)

##This is a 3 x 2 matrix. 
#The 2 columns of the matrix tells us that our model will have 2 coefficients, 
#one for the B level and one for the C level. 
#Therefore the A level is the baseline.
#The coefficients we get in our linear model for B and C will indicate 
#the respective differences of their mean from the level A mean. 
#The values in the rows tell us what values to plug into the model to get the means for the row labels.
#For example, to get the mean for A we plug in 0's for both coefficients which leaves us with the intercept.
#Therefore the intercept is the mean of A. 
#Let's see all this in action before we explore the Helmert and Sum contrasts.

m.trt <- lm(vals~flevels)
m.trt
summary(m.trt)
means



# Intercept = mean of A
coef(m.trt)[1]
means[1]

#flevelsB = mean of B - mean of A
coef(m.trt)[2]
means[2] - means[1]

#flevelsC = mean of C - mean of A
coef(m.trt)[3]
means[3] - means[1]



#plug in row values into model to get the means of A, B, and C, respectively

means
contrasts(flevels)
#mean of A -> row 1: 0 0
coef(m.trt)[1] + 0*coef(m.trt)[2] + 0*coef(m.trt)[3]

#mean of B -> row 2: 1 0
coef(m.trt)[1] + 1*coef(m.trt)[2] + 0*coef(m.trt)[3]

#mean of A -> row 1: 0 1
coef(m.trt)[1] + 0*coef(m.trt)[2] + 1*coef(m.trt)[3]









# set contrast to "contr.helmert"
contrasts(flevels) <- "contr.helmert"
contrasts(flevels)


m.hel <- lm(vals~flevels)
m.hel
summary(m.hel)

# intercept = mean of all means
coef(m.hel)[1]

mean(means)

#flevels1 = mean of first two levels minus first level

coef(m.hel)[2]
