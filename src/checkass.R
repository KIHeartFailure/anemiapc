
ProjectTemplate::reload.project()

dataass <- mice::complete(imp, 3)


# Predictors models -------------------------------------------------------


mod <- glm(formula(paste0("shf_anemia == 'Yes' ~ ", paste(modvars, collapse = " + "))),
  family = binomial(link = "logit"), data = dataass
)

# Outliers ---------------------------------------------------------------
x11()
plot(mod, which = 4, id.n = 3)

# Multicollinearity -------------------------------------------------------
print(car::vif(mod))


# check assumptions for cox models ----------------------------------------

mod <- coxph(formula(paste0(
  "Surv(sos_outtime_death6y, sos_out_death6y == 'Yes') ~ shf_anemia + ", paste(modvars, collapse = " + ")
)), data = dataass)

testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

# check spec for shf_anemia
x11()
plot(testpat[1], resid = F, ylim = c(-4, 4))



mod <- coxph(formula(paste0(
  "Surv(sos_outtime_hospany6y, sos_out_hospany6y == 'Yes') ~ shf_anemia + ", paste(modvars, collapse = " + ")
)), data = dataass)

testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

# check spec for shf_anemia
x11()
plot(testpat[1], resid = F, ylim = c(-4, 4))
