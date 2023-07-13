library(iotc.base.common.data)
library(lubridate)

LAST_UPDATE = today(tzone = "UTC")
usethis::use_data(LAST_UPDATE, overwrite = TRUE)

RAW  = SF.raw(factorize_results = FALSE)

RAW.BET  = RAW[SPECIES_CODE == "BET"]
usethis::use_data(RAW.BET, overwrite = TRUE, compress = "gzip")

RAW.SKJ  = RAW[SPECIES_CODE == "SKJ"]
usethis::use_data(RAW.SKJ, overwrite = TRUE, compress = "gzip")

RAW.YFT  = RAW[SPECIES_CODE == "YFT"]
usethis::use_data(RAW.YFT, overwrite = TRUE, compress = "gzip")

RAW.TEMP = RAW[SPECIES_CATEGORY_CODE ==     "TEMPERATE"]
usethis::use_data(RAW.TEMP, overwrite = TRUE, compress = "gzip")

RAW.BILL = RAW[SPECIES_CATEGORY_CODE ==     "BILLFISH"]
usethis::use_data(RAW.BILL, overwrite = TRUE, compress = "gzip")

RAW.NERI = RAW[SPECIES_CATEGORY_CODE ==     "NERITIC"]
usethis::use_data(RAW.NERI, overwrite = TRUE, compress = "gzip")

RAW.SEER = RAW[SPECIES_CATEGORY_CODE ==     "SEERFISH"]
usethis::use_data(RAW.SEER, overwrite = TRUE, compress = "gzip")

RAW.TNEI = RAW[SPECIES_CATEGORY_CODE ==     "TUNAS_NEI"]
usethis::use_data(RAW.TNEI, overwrite = TRUE, compress = "gzip")

RAW.SHRK = RAW[SPECIES_CATEGORY_CODE %in% c("SHARKS", "RAYS")]
usethis::use_data(RAW.SHRK, overwrite = TRUE, compress = "gzip")

RAW.OTHR = RAW[SPECIES_CATEGORY_CODE ==     "OTHERS"]
usethis::use_data(RAW.OTHR, overwrite = TRUE, compress = "gzip")

RAW.ETPS = RAW[SPECIES_CATEGORY_CODE %in% c("CETACEANS", "SEABIRDS", "TURTLES")]
usethis::use_data(RAW.ETPS, overwrite = TRUE, compress = "gzip")
