

# Variables for tabs/mods -------------------------------------------------

tabvars <- c(
  # demo
  "shf_sex",
  "shf_age",
  "shf_age_cat",
  "shf_indexyear_cat",

  # clinical factors and lab measurments
  "shf_ef_cat",
  "shf_nyha_cat",
  "shf_map",
  "shf_map_cat",
  "shf_bpsys",
  "shf_bpdia",
  "shf_heartrate",
  "shf_heartrate_cat",
  "shf_bmi",
  "shf_bmi_cat",
  "shf_hb",
  "shf_potassium",
  "shf_potassium_cat",
  "shf_gfrckdepi",
  "shf_gfrckdepi_cat",
  "shf_ntprobnp",
  "shf_ntprobnp_cat",

  # comorbs
  "shf_smoking_cat",
  "shf_sos_com_diabetes",
  "shf_sos_com_af",
  "shf_sos_com_ihd",
  "shf_sos_com_hypertension",
  "sos_com_peripheralartery",
  "sos_com_stroketia",
  "shf_sos_com_valvular",
  "sos_com_liver",
  "sos_com_cancer3y",
  "sos_com_copd",
  "sos_com_bleed",
  "sos_com_charlsonci",

  # treatments
  "shf_rasarni",
  "shf_bbl",
  "shf_mra",
  "shf_diuretic",
  "shf_device_cat",
  "shf_digoxin",
  "shf_asaantiplatelet",
  "shf_anticoagulantia",
  "shf_statin",
  "shf_nitrate",

  # organizational
  "shf_followuphfunit",
  "shf_followuplocation_cat",

  # socec
  "scb_famtype",
  "scb_child",
  "scb_education",
  "scb_dispincome_cat2"
)

tabvars_not_in_mod <- c(
  "shf_age",
  "shf_map",
  "shf_bpsys",
  "shf_bpdia",
  "shf_heartrate",
  "shf_bmi",
  "shf_hb",
  "shf_potassium",
  "shf_potassium_cat",
  "shf_gfrckdepi",
  "shf_ntprobnp",
  "sos_com_charlsonci"
)

modvars <- tabvars[!(tabvars %in% tabvars_not_in_mod)]
