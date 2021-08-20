
# Creating variables for competing risk analysis in imputed dataset ------------

crvarfunc <- function(var) {
  
  levs <- names(table(long %>% dplyr::select(!!sym(var))))
  
  namelevs <- gsub(" ", "", levs)
  namelevs <- gsub(">=|>", "over", namelevs)
  namelevs <- gsub("<=|<", "under", namelevs)
  
  for (i in 2:length(levs)) {
    varname <- paste0(var, "_cr_", gsub(" ", "", namelevs[i]))
    
    long <<- long %>%
      mutate(!!sym(varname) := case_when(
        is.na(!!sym(var)) ~ NA_real_,
        !!sym(var) == levs[i] ~ 1,
        TRUE ~ 0
      ))
  }
}

# keep org imp
imp.org <- imp

# Convert to Long
long <- mice::complete(imp, action = "long", include = TRUE)

## Create numeric variables needed for comp risk model

crvarfunc("shf_anemia")  

for (i in seq_along(modvars)){
  crvarfunc(modvars[i])  
}

# Convert back to Mids
imput.short <- as.mids(long)
imp <- imput.short