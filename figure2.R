library(ggplot2)
data_cervical2<-read.csv("data_cervical2.csv")
#convert the value of whether smoke back to integer for the dataset:
data_cervical2$Smokes<-as.factor(data_cervical2$Smokes)
png("Boxplot_age_smoke.png")
#plot the boxplot of Age regarding to tests of cervical_cancer grouped by whether or not smoke:
ggplot(data_cervical2,aes(x=cervical_cancer, y=Age, color = Smokes))+geom_boxplot()+
  labs(title = "Cervical Cancer with Age grouped by Smoking", x = "Cervical Cancer")
dev.off()
