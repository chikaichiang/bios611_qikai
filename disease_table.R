library(tidyverse)
library(tidyr)
library(gridExtra)
options(warn=-1)
d1<-read.csv("source_data/kag_risk_factors_cervical_cancer.csv")
d1_std<-d1[ , c(12:25)]
d1_std$STDs<-as.integer(d1_std$STDs)
d1_std1<-d1_std[which(!is.na(d1_std$STDs) & d1_std$STDs!=0),]
d1_std1$STD_name<-NA
x <- data.frame(row.names=paste("Name",1:11))
x[,1] <- c("Condylomatosis","Vaginal Condylomatosis","Vulvo Perineal Condylomatosis",
           "Syphilis","Pelvic Inflammatory Disease","Genital Herpes","Molluscum Contagiosum",
           "HIV","Hepatitis.B","HPV","Name1&3")
x[,2] <- c(44,4,43,18,1,1,1,18,1,2,43)
colnames(x) <- c("STD Diseases", "Count")
dev.new()
png(file="figures/disease_table.png",
    width=600, height=350)
grid.table(x)
dev.off()
