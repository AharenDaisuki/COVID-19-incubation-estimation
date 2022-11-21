source('CleanData.R')
source('PlotUtils.R')

# @Params
# filePathName: absolute path 
linearRegression<-function(filePathName){
  # before
  df = read.csv(file = filePathName)
  x = df$age # hard code
  y = df$charge # hard code
  linearModel = lm(y ~ x)
  # print(nrow(df))
  # pltLinearModel(linearModel)
  # summary(linearModel)
  # after
  df = cleanBadLeverage(linearModel, df)
  x = df$age
  y = df$charge
  linearModel = lm(y ~ x)
  # print(nrow(df))
  # pltLinearModel(linearModel)
  # summary(linearModel)
  # plot
  par(mfrow = c(1, 1))
  plot(x, y, xlab = 'age', ylab = 'charge', main = 'nonsmoker')
  abline(lsfit(x, y), col = 'red')
}

