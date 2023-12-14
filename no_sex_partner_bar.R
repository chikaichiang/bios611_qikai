library(tidyverse)
library(tidyr)
options(warn=-1)
d1<-read.csv("source_data/kag_risk_factors_cervical_cancer.csv")
no_sex_partner<-table(as.integer(d1$Number.of.sexual.partners),useNA = "ifany")
dev.new()
png(file="figures/no_sex_partners.png",
    width=600, height=350)
b <- barplot(no_sex_partner, beside=TRUE, ylim=c(0, max(no_sex_partner) + 15), 
             main="Number of Sexual Partners", xlab = "Sexual Partners Number",col=2:3, border=0)
text(b, no_sex_partner + 5, no_sex_partner, font=2, col=2:3)
dev.off()
