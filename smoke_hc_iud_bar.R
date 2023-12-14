library(tidyverse)
library(tidyr)
options(warn=-1)
d1<-read.csv("source_data/kag_risk_factors_cervical_cancer.csv")
a<-table(as.integer(d1$Smokes),useNA=c("ifany"))
b<-table(as.integer(d1$Hormonal.Contraceptives),useNA=c("ifany"))
c<-table(as.integer(d1$IUD),useNA=c("ifany"))
dev.new()
png(file="figures/smoke_hc_iud_bar.png",
    width=600, height=350)
par(mfrow = c(1, 3))
b1<-barplot(a, beside=TRUE, ylim=c(0, max(a) + 30), 
            main="Smoke Count", xlab = "Group",col=2:3, border=0)
text(b1, a + 15, a, font=2, col=2:3)
b2<-barplot(b, beside=TRUE, ylim=c(0, max(b) + 30), 
            main="Hormonal Contraceptives Count", xlab = "Group",col=2:3, border=0)
text(b2, b + 15, b, font=2, col=2:3)
b3<-barplot(c, beside=TRUE, ylim=c(0, max(c) + 30), 
            main="IUD Count", xlab = "Group",col=2:3, border=0)
text(b3, c + 15, c, font=2, col=2:3)
dev.off()
