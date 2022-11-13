pltGammaMetrics<-function(data_, title, params, binN){
  allColors = c('red', 'blue');
  xlim_ = c(0, 35000);
  ylim_ = c(0, 1e-4);
  gammaSmplSize = length(data_);
  hist(
    data_, binN,
    main = title,
    xlab = 'charge',
    xlim = xlim_,
    ylim = ylim_,
    freq = F,
    axes = F
  )
  lines(density(data_), col=allColors[1], lwd = 2);
  lines(density(rgamma(gammaSmplSize, shape = params[1], scale = params[2])), 
        col=allColors[2], 
        lwd = 2, lty = "dotted");
  axis(1);
  axis(2);
}

pltScatter<-function(x_, y_, xlabel, ylabel, main_, ylim_){
  plot(x_, y_, xlab = xlabel, ylab = ylabel, main = main_, ylim = ylim_);
}
