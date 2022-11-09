# return parameters of gamma distribution (/alpha, /beta) 
fitGamma<-function(smpl){
  # minus log likelyhood
  mll<-function(params, data){
    alpha = params[1];
    beta = params[2];
    n = length(data);
    sum = sum(data)
    sumlog = sum(log(data))
    ret = n*alpha*log(beta) + sum/beta + n*lgamma(alpha) - (alpha-1)*sumlog;
    ret 
  }
  alphaInit_ = mean(smpl)^2 / var(smpl);
  betaInit_ = var(smpl) / mean(smpl);
  ret = nlm(mll, c(alphaInit_, betaInit_), data = smpl);
  ret$estimate
}

