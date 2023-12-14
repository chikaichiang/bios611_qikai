library(tidyverse)
library(tidyr)
library(ggplot2)
d1<-read.csv("source_data/kag_risk_factors_cervical_cancer.csv")
preg<-table(as.integer(d1$Num.of.pregnancies),useNA = c("ifany"))
dev.new()
png(file="figures/preg_bar.png",
    width=600, height=350)
b <- barplot(preg, beside=TRUE, ylim=c(0, max(preg) + 20), 
             main="Pregenancy Count", col=2:3, border=0)
text(b, preg + 10, preg, font=2, col=2:3)
dev.off()
