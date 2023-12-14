library(tidyr)
options(warn=-1)
d1<-read.csv("source_data/kag_risk_factors_cervical_cancer.csv")
subset_first_last_diag<-d1[ , c('STDs..Time.since.first.diagnosis', 'STDs..Time.since.last.diagnosis')]
subset_first_last_diag$STDs..Time.since.first.diagnosis<-as.numeric(subset_first_last_diag$STDs..Time.since.first.diagnosis)
subset_first_last_diag$STDs..Time.since.last.diagnosis<-as.numeric(subset_first_last_diag$STDs..Time.since.last.diagnosis)
subset_first_last_diag1<- subset_first_last_diag[which(subset_first_last_diag$STDs..Time.since.first.diagnosis!=0 & 
                                      !is.na(subset_first_last_diag$STDs..Time.since.first.diagnosis)),]
dev.new()
png(file="figures/first_last_diag_hist.png",
    width=600, height=350)
hist(subset_first_last_diag1$STDs..Time.since.first.diagnosis, col='blue', main='First against Last Diagnosis in Year', xlab='Year',ylab="Count",xlim=c(0,25))
hist(subset_first_last_diag1$STDs..Time.since.last.diagnosis, col=rgb(1,0,0,0.5), add=TRUE)
legend('topright', c('First Diagnosis', 'Last Diagnosis'), fill=c('blue', rgb(1,0,0,0.5)))
dev.off()
