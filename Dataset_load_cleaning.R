#Import package used in the work
library(readr)
library(tidyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(janitor)

#suppress warning 
options(warn=-1)

data_cervical<-read.csv("kag_risk_factors_cervical_cancer.csv",header=T)

#replace original missing value "?" with NA:
data_cervical1<-replace(data_cervical, data_cervical == "?", NA)
#Check for each columns of the dataset how many NAs occur:
colSums(is.na(data_cervical1))
#We do not delete any columns in this dataset since the four testing result columns 
#We can combine the four testing response together to get the accuracy measure of cervical cancer:
data_cervical1$cervical_cancer<-data_cervical1$Hinselmann+data_cervical1$Schiller+data_cervical1$Citology+data_cervical1$Biopsy
#Check occurrence of values in the cervical_cancer variable:
data_cervical1 %>% 
  count(Hinselmann)
data_cervical1 %>% 
  count(Schiller)
data_cervical1 %>% 
  count(Citology)
data_cervical1 %>% 
  count(Biopsy)
data_cervical1 %>%
  count(cervical_cancer)
#Factor the cervical cancer into 5 factors, 0,1,2,3,4:
levels(data_cervical1$cervical_cancer) <- c(0,1,2,3,4)

#subset to only including have cervical cancer:
data_cervical2<-data_cervical1  %>% filter((cervical_cancer != 0))
levels(data_cervical2$cervical_cancer) <- c(1,2,3,4)

write.csv(data_cervical2,"data_cervical2.csv")

