library(ggplot2)
library(janitor)
data_cervical2<-read.csv("data_cervical2.csv")
#From the histogram of smoke and non-smoke, we have:
png("Hist_smoke_cancer.png")
ggplot(data_cervical2,aes(factor(Smokes), color = cervical_cancer)) +
  geom_histogram(stat="count",aes(fill=factor(Smokes))) +
  labs(title = "Histogram of Smoking Status by Cervical Cancer", x = "Smoke Number",y = "Count")
dev.off()

