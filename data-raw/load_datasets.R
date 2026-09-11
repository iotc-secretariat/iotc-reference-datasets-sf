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

RAW.ALL = data.table::rbindlist(list(
	RAW.TROP,
	RAW.TEMP,
	RAW.BILL,
	RAW.NERI,
	RAW.SEER,
	RAW.TNEI,
	RAW.SHRK,
	RAW.ETPS,
	RAW.OTHR
),use.names = TRUE, fill = TRUE)
RAW.ALL_AGG = RAW.ALL[, .(FISH_COUNT = sum(FISH_COUNT)), keyby = setdiff(names(RAW.ALL), c("MONTH_START", "MONTH_END", "FISH_COUNT"))]
RAW.ALL_AGG = RAW.ALL_AGG[, c("SPECIES_SCIENTIFIC", "SPECIES_FAMILY", "SPECIES_ORDER", "IS_IOTC_SPECIES", "IS_SPECIES_AGGREGATE", "IS_SSI") := NULL]
usethis::use_data(RAW.ALL_AGG, overwrite = TRUE, compress = "gzip")

LAST_UPDATE = Sys.Date()

METADATA = list(
  RAW.SF = list(
    DATA = nrow(RAW.ALL),
    LAST_UPDATE = LAST_UPDATE
  )
)
usethis::use_data(METADATA, overwrite = TRUE, compress = "gzip")
