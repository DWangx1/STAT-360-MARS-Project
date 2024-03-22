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