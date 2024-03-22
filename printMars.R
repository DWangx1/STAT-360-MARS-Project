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