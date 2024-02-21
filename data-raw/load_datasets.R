library(httr)
library(iotc.base.common.data)

RAW.TROP = SF.raw(species_category_codes = "TROPICAL")
usethis::use_data(RAW.TROP, overwrite = TRUE, compress = "gzip")

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

TOKEN = Sys.getenv("BITBUCKET_UPLOAD_SF_DATASET_TOKEN")

if(TOKEN == "") {
  stop("No 'BITBUCKET_UPLOAD_SF_DATASET_TOKEN' value found in system environment: cannot upload artifacts!")
} else {
  BITBUCKET_REPO_URL = "https://api.bitbucket.org/2.0/repositories/iotc-ws/iotc-reference-datasets-sf/downloads"

  FILES = list.files("../data", pattern = "*.rda")

  if(length(FILES) == 0) {
    stop("No .RDA files found: check that these have been produced and that you are running this script from the right directory (its container folder)")
  }

  for(file in FILES) {
    log_info(paste0("Uploading '", file, "' to BitBucket repository under ", BITBUCKET_REPO_URL))

    upload_response =
      POST(BITBUCKET_REPO_URL,
           body = list(files = upload_file(paste0("../data/", file))),
           add_headers(
              Authorization = paste0("Bearer ", TOKEN)
           )
      )

    log_info(paste0("Upload response: [", status_code, "] / ", content(upload_response)))
  }
}
