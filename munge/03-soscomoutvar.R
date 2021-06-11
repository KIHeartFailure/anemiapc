
# Additional variables from NPR -------------------------------------------

rsdata <- rsdata %>%
  mutate(sos_out_deathcancer = factor(case_when(str_detect(sos_deathcause, "^C") ~ "Yes", 
                                         TRUE ~ "No")))