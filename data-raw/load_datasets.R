library(httr)
library(iotc.base.common.data)

LAST_UPDATE = Sys.Date()
usethis::use_data(LAST_UPDATE, overwrite = TRUE, compress = "gzip")

RAW.TEMP = SF.raw(species_category_codes = "TEMPERATE")
usethis::use_data(RAW.TEMP, overwrite = TRUE, compress = "gzip")

RAW.TROP = SF.raw(species_category_codes = "TROPICAL")
usethis::use_data(RAW.TROP, overwrite = TRUE, compress = "gzip")

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

BITBUCKET_REPO_URL = paste0("https://api.bitbucket.org/2.0/repositories/iotc-ws/iotc-reference-datasets-sf/downloads")

for(file in list.files("../data", pattern = "*.rda")) {
  log_info(paste0("Uploading '", file, "' to BitBucket repository under ", BITBUCKET_REPO_URL))

  upload_response =
    POST(BITBUCKET_REPO_URL,
         body = list(files = upload_file(paste0("../data/", file))),
         add_headers(
            Authorization = paste0("Bearer ", Sys.getenv("BITBUCKET_UPLOAD_SF_DATASET_TOKEN"))
         )
    )

  log_info(paste0("Upload response: ", upload_response))
}
