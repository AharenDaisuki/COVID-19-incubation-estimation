library(foreign)
library(car)
library(carData)

avPlotUtils<-function(){
  df = read.csv(filePathName_)
  model = lm(charge ~ bmi + ages, data = df)
  avPlots(model)
}

crPlotUtils<-function(){
  df = read.csv(filePathName_)
  model = lm(charge ~ bmi + age, data = df)
  crPlots(model)
}

infPlotUtils<-function(filePathName_){
  df = read.csv(filePathName_)
  model = lm(charge ~ bmi + age, data = df)
  influencePlot(model)
}

