mhairi<-read.csv("refine_original.csv")
mhairi

install.packages("plyr")
install.packages("dplyr")
library(plyr)
library(dplyr)
View(mhairi)

codedcomp<-c("philips","akzo","van houten","unilever")
x<-adist(chap$company,codedcomp)
y<-apply(x,1,which.min)
data.frame(rawtext=chap$company,coded=codedcomp[y])
chap$company<-codedcomp[y]
chap$company

??separate
mhairi<-data.frame(mhairi)
mhairi %>% separate(mhairi,Product.code...number,c("product_code","product_number"),sep="-",remove=TRUE)
table()