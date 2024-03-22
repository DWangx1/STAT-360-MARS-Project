#code snippet taken from lecture 13
predict.mars <- function(mout, newdata) {
  
  #checks if new data is provided
  if(missing(newdata) || is.null(newdata))
  {
    #returns existing basis matrix if no new data
    X <- mout$B
  }
  else {
    
    #extracting response and design matrix from model frame of new data
    tt <- terms(mout$formula)
    tt <- delete.response(tt)
    mf <- model.frame(tt, newdata)
    mt <- attr(mf, "terms")
    X <- model.matrix(mt,mf)
    
    X <- split_X(X, mout$splits)
    
  }
  
  #returns predicted value
  beta <- mout$coefficients
  drop(X %*% beta)
}

#code snippet taken from lecture 13
split_X <- function(X, splits) {
  
  #create new basis matrix
  Xout <- matrix(0, nrow = nrow(X), ncol = length(splits))
  
  #loop through the number of splits
  for(i in 1:length(splits)) {
    Xout[,i] <- one_split_X(X, splits[[i]])
  }
  Xout
}

#code snipped taken from lecture 13
one_split_X <- function(X,s) {
  #initialize basis matrix with intercept
  Xout <- rep(1, nrow(X))
  if(nrow(s)>1) {
    for (i in 2:nrow(s)) {
      #new basis matrix from product of hinge function
      Xout <- Xout * h(s[i,"s"], X[,s[i,"v"]], s[i,"t"])
    }
  }
  Xout
}