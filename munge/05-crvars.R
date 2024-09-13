
# Creating variables for competing risk analysis in imputed dataset ------------

# keep org imp
imp.org <- imp

# Convert to Long
long <- mice::complete(imp, action = "long", include = TRUE)

## Create numeric variables needed for comp risk model
long <- create_crvar(long, "shf_anemia")

for (i in seq_along(modvars)) {
  long <- create_crvar(long, modvars[i])
}

# Convert back to Mids
imput.short <- as.mids(long)
imp <- imput.short

impunder80 <- mice::filter(imp, rsdata$shf_age < 80)
impover80 <- mice::filter(imp, rsdata$shf_age >= 80)
