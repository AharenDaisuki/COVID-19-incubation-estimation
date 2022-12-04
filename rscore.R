rscore<-function(ypredict,ytrue){
  ymean=mean(ytrue)
  Stotal=sum((ytrue-ymean)^2)
  Sres=sum((ytrue-ypredict)^2)
  R=1-Sres/Stotal
  return(R)
}