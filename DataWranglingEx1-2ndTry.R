library(dplyr)
library(plyr)
library(tidyr)
chap<-read.csv("refine_original.csv")
glimpse(chap)
View(chap)
chap<-tbl_df(chap)
codedcomp<-c("philips","akzo","van houten","unilever")
x<-adist(chap$company,codedcomp)
y<-apply(x,1,which.min)
##check with## data.frame(rawtext=chap$company,coded=codedcomp[y])
chap$company<-codedcomp[y]
chap$company
View(chap)

?separate
chap<-separate(chap,Product.code...number,c("product_code","product_number"),sep="-",remove=TRUE)
View(chap)

?mapvalues
product_category<-mapvalues(chap$product_code,from=c("p","q","v","x"),to=c("Smartphone","Tablet","TV","Laptop"))
chap<-cbind(chap,product_category)
View(chap)

?unite
chap<-unite(chap,"full_address",c(address,city,country),sep=", ",remove=TRUE)
View(chap)

?mutate
chap<-mutate(chap,
  product_smartphone=ifelse(product_category=="Smartphone",1,0),
  product_laptop=ifelse(product_category=="Laptop",1,0),
  product_tv=ifelse(product_category=="TV",1,0),
  product_tablet=ifelse(product_category=="Tablet",1,0))

chap<-mutate(chap,
             company_philips=ifelse(company=="philips",1,0),
             company_akzo=ifelse(company=="akzo",1,0),
             company_van_houten=ifelse(company=="van houten",1,0),
             company_unilever=ifelse(company=="unilever",1,0))

View(chap)

?write.csv
write.csv(chap,file="C:/Users/jpark.FACS/Desktop/DataSciDir/refine_clean2.csv",sep="\t")
