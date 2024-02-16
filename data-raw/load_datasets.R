library(iotc.base.common.data)

SF.RAW.TEMP = SF.raw(species_category_codes = "TEMPERATE")
usethis::use_data(SF.RAW.TEMP, overwrite = TRUE, compress = "gzip")

SF.RAW.TROP = SF.raw(species_category_codes = "TROPICAL")
usethis::use_data(SF.RAW.TROP, overwrite = TRUE, compress = "gzip")

SF.RAW.BILL = SF.raw(species_category_codes = "BILLFISH")
usethis::use_data(SF.RAW.BILL, overwrite = TRUE, compress = "gzip")

SF.RAW.NERI = SF.raw(species_category_codes = "NERITIC")
usethis::use_data(SF.RAW.NERI, overwrite = TRUE, compress = "gzip")

SF.RAW.SEER = SF.raw(species_category_codes = "SEERFISH")
usethis::use_data(SF.RAW.SEER, overwrite = TRUE, compress = "gzip")

SF.RAW.TNEI = SF.raw(species_category_codes = "TUNAS_NEI")
usethis::use_data(SF.RAW.TNEI, overwrite = TRUE, compress = "gzip")

SF.RAW.SHRK = SF.raw(species_category_codes = c("SHARKS", "RAYS"))
usethis::use_data(SF.RAW.SHRK, overwrite = TRUE, compress = "gzip")

SF.RAW.ETPS = SF.raw(species_category_codes = c("CETACEANS", "SEABIRDS", "TURTLES"))
usethis::use_data(SF.RAW.ETPS, overwrite = TRUE, compress = "gzip")

SF.RAW.OTHR = SF.raw(species_category_codes = c("OTHERS"))
usethis::use_data(SF.RAW.OTHR, overwrite = TRUE, compress = "gzip")

LAST_UPDATE = Sys.Date()
usethis::use_data(LAST_UPDATE, overwrite = TRUE, compress = "gzip")
