install.packages("scatterplot3d") # Install
library("scatterplot3d")
data<-read.csv("insurance.csv",header=TRUE)
attach(data)
scatterplot3d(age,bmi,charges)
mylm<-lm(charges~age+bmi)
predict(mylm,newdata=data.frame(age,bmi))
