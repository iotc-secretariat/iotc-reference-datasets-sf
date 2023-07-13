library(iotc.base.common.data)

SF_RAW_ALL  = SF.raw(factorize_results = FALSE)
usethis::use_data(SF_RAW_ALL, overwrite = TRUE)

SF_RAW_TEMP = SF_RAW_ALL[SPECIES_CATEGORY_CODE ==     "TEMPERATE"]
SF_RAW_TROP = SF_RAW_ALL[SPECIES_CATEGORY_CODE ==     "TROPICAL"]
SF_RAW_BILL = SF_RAW_ALL[SPECIES_CATEGORY_CODE ==     "BILLFISH"]
SF_RAW_NERI = SF_RAW_ALL[SPECIES_CATEGORY_CODE ==     "NERITIC"]
SF_RAW_SEER = SF_RAW_ALL[SPECIES_CATEGORY_CODE ==     "SEERFISH"]
SF_RAW_TNEI = SF_RAW_ALL[SPECIES_CATEGORY_CODE ==     "TUNAS_NEI"]
SF_RAW_SHRK = SF_RAW_ALL[SPECIES_CATEGORY_CODE %in% c("SHARKS", "RAYS")]
SF_RAW_OTHR = SF_RAW_ALL[SPECIES_CATEGORY_CODE ==     "OTHERS"]
SF_RAW_ETPS = SF_RAW_ALL[SPECIES_CATEGORY_CODE %in% c("CETACEANS", "SEABIRDS", "TURTLES")]

if(FALSE) {
  usethis::use_data(SF_RAW_TEMP, overwrite = TRUE)
  usethis::use_data(SF_RAW_TROP, overwrite = TRUE)
  usethis::use_data(SF_RAW_BILL, overwrite = TRUE)
  usethis::use_data(SF_RAW_NERI, overwrite = TRUE)
  usethis::use_data(SF_RAW_SEER, overwrite = TRUE)
  usethis::use_data(SF_RAW_TNEI, overwrite = TRUE)
  usethis::use_data(SF_RAW_SHRK, overwrite = TRUE)
  usethis::use_data(SF_RAW_OTHR, overwrite = TRUE)
  usethis::use_data(SF_RAW_ETPS, overwrite = TRUE)
}
