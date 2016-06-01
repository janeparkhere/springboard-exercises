titan0<-read.csv("titanic_original.csv")
any(is.na(titan0$embarked))
titan0
head(titan0,2)
any(is.na(titan0$embarked))
titan0$embarked[170]
class(titan0$embarked)
titan0$embarked[169]
any(is.na(titan0$embarked))
embarkedNA<-which(is.na(titan0$embarked))
embarkedNA
titan0$embarked[embarkedNA]<-"S"
titan0$embarked[169]
avgage2<-titan0 %>% summarise(avgage1=mean(age, na.rm=TRUE))
ageNA<-which(is.na(titan0$age))
avgage2
ageNA
titan0$age[ageNA]<-avgage2
titan0$age[1298]

any(is.na(titan0$boat))
?which
boatNA<-which(titan0$boat=="")
head(titan0)
titan0$boat[boatNA]<-NA
titan0$boat[3]
titan0$boat
head(titan0,20)
titan0$cabin


tbl(titan0$boat)
table(titan0$embarked, useNA = 'ifany')
?table

any(is.na(titan0$boat))
which(is.na(titan0$boat))
boatNA
titan0$boat[boatNA]
titan0 %>%
  select(cabin, survived) %>% 
  group_by(survived) %>% 
  summarise(n=count(cabin))

titan0 %>% 
  select(cabin, survived) %>% 
  arrange(survived)

?ifelse
?mapvalues

class(titan0$cabin)

titan0<-titan0 %>%
  mutate(has_cabin_number = ifelse(cabin=="",0,1))
getwd()
str(titan0)
View(titan0)
titan0
?write.csv
write.csv(titan0, file="titanic_clean.csv")
getwd()
write.csv(titan0, file="exported)data.csv")


f<-c(1,2,3,4,5,6,7,8,9,8,7,6,5,4,3,2,1)
write.csv(titan0,file="killme.csv",row.names=FALSE)

write.table(titan0,file="killmeee.txt",sep=" ")

typeof(titan0)
as.matrix(titan0)
typeof(titan0)
as.character(titan0)
typeof(titan0)
?as.JSON

glimpse(titan0)
titan1 <- data.frame(matrix(unlist(titan0), nrow=1309),stringsAsFactors=FALSE)
titan1
typeof(titan1)
write.csv(titan1,file="ughfxck.csv",row.names=FALSE)
