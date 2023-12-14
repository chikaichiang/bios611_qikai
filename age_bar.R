library(tidyverse)
library(tidyr)
d1<-read.csv("source_data/kag_risk_factors_cervical_cancer.csv")
age<-table(d1$Age)
options(warn=-1)
dev.new()
png(file="figures/age_bar.png",
    width=600, height=350)
b <- barplot(age, beside=TRUE, ylim=c(0, max(age) + 15), 
             main="Age Count", col=2:3, border=0)
text(b, age + 5, age, font=2, col=2:3)
dev.off()

