library(tidyverse)
library(tidyr)
d1<-read.csv("source_data/kag_risk_factors_cervical_cancer.csv")
std_nums<-table(as.integer(d1$STDs..number.),useNA = c("ifany"))
dev.new()
png(file="figures/std_no_hist.png",
    width=600, height=350)
b <- barplot(std_nums, beside=TRUE, ylim=c(0, max(std_nums) + 50), 
             main="STD Diseases Diagnosis Number Histogram", xlab="Disease Number", col=2:3, border=0)
text(b, std_nums + 15, std_nums, font=2, col=2:3)
dev.off()