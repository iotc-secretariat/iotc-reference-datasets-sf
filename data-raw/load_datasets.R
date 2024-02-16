library(iotc.base.common.data)

LAST_UPDATE = Sys.Date()
usethis::use_data(LAST_UPDATE, overwrite = TRUE, compress = "gzip")

RAW.TEMP = RAW(species_category_codes = "TEMPERATE")
usethis::use_data(RAW.TEMP, overwrite = TRUE, compress = "gzip")

RAW.TROP = RAW(species_category_codes = "TROPICAL")
usethis::use_data(RAW.TROP, overwrite = TRUE, compress = "gzip")

RAW.BILL = RAW(species_category_codes = "BILLFISH")
usethis::use_data(RAW.BILL, overwrite = TRUE, compress = "gzip")

RAW.NERI = RAW(species_category_codes = "NERITIC")
usethis::use_data(RAW.NERI, overwrite = TRUE, compress = "gzip")

RAW.SEER = RAW(species_category_codes = "SEERFISH")
usethis::use_data(RAW.SEER, overwrite = TRUE, compress = "gzip")

RAW.TNEI = RAW(species_category_codes = "TUNAS_NEI")
usethis::use_data(RAW.TNEI, overwrite = TRUE, compress = "gzip")

RAW.SHRK = RAW(species_category_codes = c("SHARKS", "RAYS"))
usethis::use_data(RAW.SHRK, overwrite = TRUE, compress = "gzip")

RAW.ETPS = RAW(species_category_codes = c("CETACEANS", "SEABIRDS", "TURTLES"))
usethis::use_data(RAW.ETPS, overwrite = TRUE, compress = "gzip")

RAW.OTHR = RAW(species_category_codes = c("OTHERS"))
usethis::use_data(RAW.OTHR, overwrite = TRUE, compress = "gzip")
