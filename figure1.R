library(ggplot2)
data_cervical2<-read.csv("data_cervical2.csv")
#plot the boxplot of Age regarding to tests of cervical_cancer:
data_cervical2$cervical_cancer<-as.factor(data_cervical2$cervical_cancer)

png("Boxplot_age.png")
ggplot(data=data_cervical2, mapping=aes(x=cervical_cancer, y=Age, fill=cervical_cancer))+geom_boxplot()+
  stat_summary(fun.y=mean, geom="point", shape=20, size=3, color="red",
               position = position_dodge2(width = 0.75,   
                                          preserve = "single"))
dev.off()

