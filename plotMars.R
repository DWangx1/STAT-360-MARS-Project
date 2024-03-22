plot.mars <- function(mout) {
  plot(mout$formula, data = mout$data)
  #meaningful plots boxplot,scatterplot for 1d + add levels 
  plot(mout$fitted.values, mout$residuals, pch = '.', cex = 2, col = 'red', xlab = 'Fitted Values', ylab = 'Residual values', main = 'Residual Plot')
  abline(h=0, lwd=2)
  
  plot(mout$fitted.values, predict.mars(mout))
  #have input whether if variable is categorical/factor or continuous
}