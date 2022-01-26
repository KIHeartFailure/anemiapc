

# Inclusion/exclusion criteria --------------------------------------------------------

rsdata <- rsdata326 %>%
  filter(casecontrol == "Case")

flow <- c("Number of posts (cases) in SHFDB3", nrow(rsdata))

rsdata <- rsdata %>%
  filter(shf_centretype == "Primary care")
flow <- rbind(flow, c("Registred at a primary care centre", nrow(rsdata)))

rsdata <- rsdata %>%
  filter(!is.na(shf_hb))
flow <- rbind(flow, c("Not missing Hb", nrow(rsdata)))

rsdata <- rsdata %>%
  group_by(LopNr) %>%
  arrange(shf_indexdtm) %>%
  slice(n()) %>%
  ungroup()

flow <- rbind(flow, c("Last post / patient", nrow(rsdata)))

colnames(flow) <- c("Criteria", "N")
