getwd()
setwd("C:/Users/jpark.FACS/Desktop/jptrain/capstone1")
getwd()

compas<-read.csv("compas-scores.csv")
head(compas)
comscore_raw<-read.csv("compas-scores-raw.csv")
comscore_2yrs<-read.csv("compas-scores-two-years.csv")
comscore_2yrs_violent<-read.csv("compas-scores-two-years-violent.csv")

head(comscore_raw)
head(compas)
head(comscore_2yrs)
head(comscore_2yrs_violent)

library(dplyr)
library(plyr)
library(tidyr)
library(ggplot2)

View(comscore)

?attributes
var_info <- attributes(comscore)$labels
var_info


## difference between charges... misdemeanor vs felony vs other?

## manipulate data combine all data on one person into 1 observation
## cast/melt new columns including risk of violence, recidivism, failure to appear



## check str() of each data set available; which fields are missing?
str(compas)
str(comscore_raw)
str(comscore_2yrs)
str(comscore_2yrs_violent)

## match compas-scores-raw with compas-scores
subset(comscore_raw, FirstName == "Kevon")

## ggplot scatter plot by race, gender, age, custodystatus, year?, language, marital status, recsupervisionleveltext



## feature engineering
## age category?


## linear regression



## logistic regression




## clustering 




## possible to use training/test set for k-means clustering
## or is hierarchical clustering more appropriate?



