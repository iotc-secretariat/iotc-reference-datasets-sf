library(iotc.base.common.data)
library(lubridate)

RAW.LAST_UPDATE = today(tzone = "UTC")
usethis::use_data(RAW.LAST_UPDATE, overwrite = TRUE)

RAW.ALL  = SF.raw(factorize_results = FALSE)
usethis::use_data(RAW.ALL, overwrite = TRUE)

RAW.TEMP = RAW.ALL[SPECIES_CATEGORY_CODE ==     "TEMPERATE"]
RAW.TROP = RAW.ALL[SPECIES_CATEGORY_CODE ==     "TROPICAL"]
RAW.BILL = RAW.ALL[SPECIES_CATEGORY_CODE ==     "BILLFISH"]
RAW.NERI = RAW.ALL[SPECIES_CATEGORY_CODE ==     "NERITIC"]
RAW.SEER = RAW.ALL[SPECIES_CATEGORY_CODE ==     "SEERFISH"]
RAW.TNEI = RAW.ALL[SPECIES_CATEGORY_CODE ==     "TUNAS_NEI"]
RAW.SHRK = RAW.ALL[SPECIES_CATEGORY_CODE %in% c("SHARKS", "RAYS")]
RAW.OTHR = RAW.ALL[SPECIES_CATEGORY_CODE ==     "OTHERS"]
RAW.ETPS = RAW.ALL[SPECIES_CATEGORY_CODE %in% c("CETACEANS", "SEABIRDS", "TURTLES")]

if(FALSE) {
  usethis::use_data(RAW.TEMP, overwrite = TRUE)
  usethis::use_data(RAW.TROP, overwrite = TRUE)
  usethis::use_data(RAW.BILL, overwrite = TRUE)
  usethis::use_data(RAW.NERI, overwrite = TRUE)
  usethis::use_data(RAW.SEER, overwrite = TRUE)
  usethis::use_data(RAW.TNEI, overwrite = TRUE)
  usethis::use_data(RAW.SHRK, overwrite = TRUE)
  usethis::use_data(RAW.OTHR, overwrite = TRUE)
  usethis::use_data(RAW.ETPS, overwrite = TRUE)
}
