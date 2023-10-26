#Import package used in the work
library(readr)
library(tidyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(janitor)

#suppress warning 
options(warn=-1)

data_cervical<-read.csv("work/kag_risk_factors_cervical_cancer.csv",header=T)
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
#Check occurence of age in the dataset:
data_cervical1 %>% 
  count(Age)
count_Age<-data_cervical1 %>% 
  count(Age)
count_Age %>% arrange(desc(n))
#where most people are in the age of 15 to 40

#subset to only including have cervical cancer:
data_cervical2<-data_cervical1  %>% filter((cervical_cancer != 0))
levels(data_cervical2$cervical_cancer) <- c(1,2,3,4)
#plot the boxplot of Age regarding to tests of cervical_cancer:
data_cervical2$cervical_cancer<-as.factor(data_cervical2$cervical_cancer)
ggplot(data=data_cervical2, mapping=aes(x=cervical_cancer, y=Age, fill=cervical_cancer))+geom_boxplot()+
  stat_summary(fun.y=mean, geom="point", shape=20, size=3, color="red",
               position = position_dodge2(width = 0.75,   
                                  preserve = "single"))
#with the boxplot, we see that the age of only tested out cervical cancer for 1 time is significantly lower 
#than age of tested out more than 1 method
#there is a very sginificant outlier of age of above 80 for testing out cervical cancer for 1 time, 
#from subsetting we see the test method is Schiller 
data_cervical2  %>% filter((Age >=80))

#convert the value of whether smoke back to integer for the dataset:
data_cervical2$Smokes<-as.factor(data_cervical2$Smokes)
#plot the boxplot of Age regarding to tests of cervical_cancer grouped by whether or not smoke:
ggplot(data_cervical2,aes(x=cervical_cancer, y=Age, color = Smokes))+geom_boxplot()+
                  labs(title = "Cervical Cancer with Age grouped by Smoking", x = "Cervical Cancer")
#from the boxplot, we see thet age will be significantly higher for smokers to have cervical cancer
#however for testing out by 4 methods, there is only one patient smokes, one patient with no smoking data avaliable  
data_cervical2  %>% filter(Smokes==1&cervical_cancer==4)
data_cervical2  %>% filter(Smokes==0&cervical_cancer==4)

data_cervical2  %>% filter(Smokes==1&cervical_cancer==3)
data_cervical2  %>% filter(Smokes==0&cervical_cancer==3)

data_cervical2  %>% filter(Smokes==1&cervical_cancer==2)
data_cervical2  %>% filter(Smokes==0&cervical_cancer==2)

data_cervical2  %>% filter(Smokes==1&cervical_cancer==1)
data_cervical2  %>% filter(Smokes==0&cervical_cancer==1)

#From the histogram of smoke and non-smoke, we have:
ggplot(data_cervical2,aes(factor(Smokes), color = cervical_cancer)) +
  geom_histogram(stat="count",aes(fill=Smokes)) +
  labs(title = "Histogram of Smoking Status by Cervical Cancer", x = "Smoke Number",y = "Count")
#we see that there is significant less amount smoking for people having cervical cancer in general. Also for each 
#cervical cancer group not smoking is significantly less than smoking  