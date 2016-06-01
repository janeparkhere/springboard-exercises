install.packages("readxl")
??read_excel
library(readxl)
titan0<-read_excel("C:/Users/jpark.FACS/Desktop/DataSciDir/titanic3.xls")

titan0<-read.csv("titanic_original.csv")
library(plyr)
library(dplyr)
library(tidyr)
glimpse(titan0)
View(titan0)
table(titan0$embarked)
any(is.na(titan0$embarked))
embarkedNA<-which(is.na(titan0$embarked))
titan0$embarked[embarkedNA]<-"S"

avgage2<-titan0 %>% 
  summarise(avgage1=mean(age,na.rm=TRUE))

avgage2

ageNA<-which(is.na(titan0$age))
titan0$age[ageNA]<-avgage2
any(is.na(titan0$age))

any(is.na(titan0$boat))
boatNA<-which(is.na(titan0$boat))
titan0$boat[boatNA]<-"NA"

View(titan0 %>% 
  select(cabin,survived) %>% 
  arrange(survived))

titan0<-titan0 %>% 
  mutate(has_cabin_number=ifelse(is.na(cabin)==TRUE,0,1))

typeof(titan0)
write.csv(titan1,file="titanic_clean.csv")

titan1<-data.frame(matrix(unlist(titan0)), stringsAsFactors=FALSE)
write.csv(titan1,file="titanic_clean.csv")
typeof(titan1)
str(titan0)

View(titan1)
