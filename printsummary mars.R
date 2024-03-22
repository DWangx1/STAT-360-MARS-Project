#maybe indicate its multivariate if nrow>2 or something


summary.mars <- function(mout) {
  variable_names <- mout$x_names
  splits <- mout$splits
  basis <- mout$B
  basis_names <- colnames(basis)
  cat("Basis Functions:", "\n", "B0:","\n","Intercept","\n")
  #issues
  for(i in 2:length(basis_names)) {
    cat(basis_names[[i]])
    print_Summary(variable_names, splits[[i]])

  }
  print(mout$formula)
  cat("\n","Coefficients", "\n")
  mout$coefficients
  
  
}


print_Summary <- function(variable_names, s) {
  for (i in 2:nrow(s)) {
    cat("\n", "Component: ",s[i,"m"],"; variable",variable_names[s[i,"v"]], "; sign ",s[i,"s"], "; split at value", s[i,"t"],"\n")
  }
}


print.mars <- function(mout) {
  mout$formula
  variable_names <- mout$x_names
  splits <- mout$splits
  coefficients <- mout$coefficients
  basis <- mout$B
  basis_names <- colnames(basis)
  cat("Basis Functions:", "\n","\n", "B0:","; Coefficient:",coefficients[[1]],"\n","Intercept","\n","\n")
  for(i in 2:length(basis_names)) {
    cat(basis_names[[i]],"; Coefficient: ",coefficients[[i]],"\n")
    print_Print(variable_names, splits[[i]])
    cat("\n")
  }
}


print_Print <- function(variable_names, s) {
  for(i in 2:nrow(s)) {
    cat("variable",variable_names[s[i,"v"]], "\n")
  }
}