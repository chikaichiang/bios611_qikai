library(tidyverse)
library(tidyr)
library(ggplot2)
options(warn=-1)
d1<-read.csv("source_data/kag_risk_factors_cervical_cancer.csv")
d1$CervicalCancer = d1$Hinselmann + d1$Schiller + d1$Citology + d1$Biopsy
d1$CervicalCancer = factor(d1$CervicalCancer, levels=c("0","1","2","3","4"))

ggplot(d1, aes(x = Age, fill=CervicalCancer))+
  geom_density(alpha = 0.40, color=NA)+
  scale_fill_manual(values=c("green","yellow","orange","red","blue"))+
  labs(title = "Density of Cervical Cancer across Age")+
  theme(plot.title = element_text(hjust = 0.5))+
  facet_grid(as.factor(CervicalCancer) ~ .)
ggsave("figures/age_cervical_cancer_density.png")
