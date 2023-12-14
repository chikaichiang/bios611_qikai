library(tidyverse)
library(tidyr)
options(warn=-1)
d1<-read.csv("source_data/kag_risk_factors_cervical_cancer.csv")
cervical_cancer_test<-d1$Hinselmann+d1$Schiller+d1$Citology+d1$Biopsy
levels(cervical_cancer_test)<-c(0,1,2,3,4)
cerv<-table(cervical_cancer_test)
dev.new()
png(file="figures/cerv_cancer_result_hist.png",
    width=600, height=350)
b <- barplot(cerv, beside=TRUE, ylim=c(0, max(cerv) + 50), 
             main="Cervical Cancer Test Positive Result Count", xlab = "Counts", col=2:3, border=0)
text(b, cerv + 20, cerv, font=2, col=2:3)
dev.off()
