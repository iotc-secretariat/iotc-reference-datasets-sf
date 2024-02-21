library(iotc.base.common.data)

RAW.TROP = SF.raw(species_category_codes = "TROPICAL")
usethis::use_data(RAW.TROP, overwrite = TRUE, compress = "gzip")

RAW.TROP.BET = RAW.TROP[SPECIES_CODE == "BET"]
usethis::use_data(RAW.TROP.BET, overwrite = TRUE, compress = "gzip")

RAW.TROP.SKJ = RAW.TROP[SPECIES_CODE == "SKJ"]
usethis::use_data(RAW.TROP.SKJ, overwrite = TRUE, compress = "gzip")

RAW.TROP.YFT = RAW.TROP[SPECIES_CODE == "YFT"]
usethis::use_data(RAW.TROP.YFT, overwrite = TRUE, compress = "gzip")

RAW.TEMP = SF.raw(species_category_codes = "TEMPERATE")
usethis::use_data(RAW.TEMP, overwrite = TRUE, compress = "gzip")

RAW.BILL = SF.raw(species_category_codes = "BILLFISH")
usethis::use_data(RAW.BILL, overwrite = TRUE, compress = "gzip")

RAW.NERI = SF.raw(species_category_codes = "NERITIC")
usethis::use_data(RAW.NERI, overwrite = TRUE, compress = "gzip")

RAW.SEER = SF.raw(species_category_codes = "SEERFISH")
usethis::use_data(RAW.SEER, overwrite = TRUE, compress = "gzip")

RAW.TNEI = SF.raw(species_category_codes = "TUNAS_NEI")
usethis::use_data(RAW.TNEI, overwrite = TRUE, compress = "gzip")

RAW.SHRK = SF.raw(species_category_codes = c("SHARKS", "RAYS"))
usethis::use_data(RAW.SHRK, overwrite = TRUE, compress = "gzip")

RAW.ETPS = SF.raw(species_category_codes = c("CETACEANS", "SEABIRDS", "TURTLES"))
usethis::use_data(RAW.ETPS, overwrite = TRUE, compress = "gzip")

RAW.OTHR = SF.raw(species_category_codes = c("OTHERS"))
usethis::use_data(RAW.OTHR, overwrite = TRUE, compress = "gzip")

LAST_UPDATE = Sys.Date()

METADATA = list(
  RAW.SF = list(
    DATA = nrow(
      rbind(
        RAW.TROP,
        RAW.TEMP,
        RAW.BILL,
        RAW.NERI,
        RAW.SEER,
        RAW.TNEI,
        RAW.SHRK,
        RAW.ETPS,
        RAW.OTHR
      )
    ),
    LAST_UPDATE = LAST_UPDATE
  )
)
usethis::use_data(METADATA, overwrite = TRUE, compress = "gzip")
