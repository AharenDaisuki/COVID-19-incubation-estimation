source('PlotUtils.R')

linearReg<-function(x_, y_, xlabel_, ylabel_, main_, ylim_){
  # origin
  pltScatter(x_, y_, xlabel_, ylabel_, main_, ylim_)
  abline(lsfit(x_, y_), col = 'red')
  
  # linear model
  orig = lm(x_ ~ y_)
  # summary(orig)
  # confint(orig, level = 0.95)
  orig
}
