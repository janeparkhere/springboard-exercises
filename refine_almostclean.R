getwd()
setwd("C:/Users/jpark.FACS/Desktop/DataSciDir")
getwd()
list.files()
ls()
chap<-read.csv("refine_original.csv")
chap
str(chap)
glimpse(chap)
install.packages("dplyr","plyr")
glimpse(chap)
library(dplyr)
library(plyr)
View(chap)
glimpse(chap)
print(chap)
str(chap)
chaptbl<-tbl_df(chap)
chaptbl
chap
grepl("philips", chap$company)
codedcomp<-c("philips", "akzo", "van houten", "unilever")
x<-adist(chap$company,codedcomp)
y<-apply(x,1,which.min)
data.frame(rawtext=chap$company,coded=codedcomp[y])
chap$company<-codedcomp[y]
chap
class(chap$company)
?strsplit
class(chap$Product.code...number)
as.character(chap$Product.code...number)
strsplit(chap$Product.code...number, "-")
library(stringr)
install.packages(dplyr)
library(dplyr)
library(plyr)
library(stringr)
strsplit("d-83","-")
s<-strsplit(as.character(chap$Product.code...number),"-")
s
smat<-matrix(unlist(s), ncol=2, byrow=TRUE)
smat
?unlist
class(smat)
dim(smat)
colnames(smat)<-c("product_code", "product_number")
smat
?cbind
chap<-cbind(chap, smat)
chap
class(chap$product_code)
class(chap$product_code)
codedprod<-c("p"="Smartphone","q"="Tablet","v"="TV","x"="Laptop")
product_category<-factor(chap$product_code, levels=codedprod, labels=names(codedprod))
class(product_category)
product_code
product_code<-factor(product_category, levels=codedprod, labels=names(codedprod))
product_code
chap<-cbind(chap, product_category)
chap
head(chap)
full_address<-matrix(paste(chap$address,chap$city,chap$country, sep=", "))
full_address
chap<-cbind(chap,full_address)
chap
View(chap)

?contrast
?contr.treatment
contr.treatment(4, base=1, contrasts=TRUE, sparse=FALSE)
chap
install.packages("xlsx")
write.table(chap, "C:/Users/jpark.FACS/Desktop/DataSciDir/refine_almostclean.csv", sep="\t")
