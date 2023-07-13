library(iotc.base.common.data)
library(iotc.base.common.std)
library(lubridate)

STD.LAST_UPDATE = today(tzone = "UTC")
usethis::use_data(STD.LAST_UPDATE, overwrite = TRUE)

SPECIES_CFG =
  query(
    connection = DB_IOTDB(),
    query = "
      SELECT
        Species AS SPECIES_CODE,
        StdSizeCode AS LENGTH_CODE,
        MaxStdSize AS MAX_SIZE,
        StdSizeClassInt AS STANDARD_BIN_SIZE,
        MaxSizeClassInt AS MAX_BIN_SIZE,
        FirstSizeClass AS FIRST_SIZE_CLASS
      FROM
        estSpecies")

standardize = function(sf_data) {
  first_species = TRUE

  STANDARDIZED_SF = NULL

  for(species in unique(sf_data$SPECIES_CODE)) {
    l_info(paste0("Processing S-F data for ", species))

    species_cfg = SPECIES_CFG[SPECIES_CODE == species]

    size_frequency = sf_data[SPECIES_CODE == species]

    if(nrow(size_frequency) == 0) {
      l_warn(paste0("No raw S-F data for ", species))
    } else {
      current_species_sf =
        standardize_size_frequencies(
          size_frequency,
          bin_size = species_cfg$STANDARD_BIN_SIZE,
          max_bin_size = species_cfg$MAX_BIN_SIZE,
          first_class_low = species_cfg$FIRST_SIZE_CLASS,
        )

      if(nrow(current_species_sf) > 0) {
        if(first_species) {
          STANDARDIZED_SF = current_species_sf
          first_species = FALSE
        } else
          STANDARDIZED_SF = rbind(STANDARDIZED_SF, current_species_sf)
      }
    }
  }

  return(STANDARDIZED_SF)
}

STD.ALL = decorate(standardize(RAW.ALL), factorize = FALSE)
usethis::use_data(STD.ALL, overwrite = TRUE)

STD.TEMP = STD.ALL[SPECIES_CATEGORY_CODE ==     "TEMPERATE"]
STD.TROP = STD.ALL[SPECIES_CATEGORY_CODE ==     "TROPICAL"]
STD.BILL = STD.ALL[SPECIES_CATEGORY_CODE ==     "BILLFISH"]
STD.NERI = STD.ALL[SPECIES_CATEGORY_CODE ==     "NERITIC"]
STD.SEER = STD.ALL[SPECIES_CATEGORY_CODE ==     "SEERFISH"]
STD.TNEI = STD.ALL[SPECIES_CATEGORY_CODE ==     "TUNAS_NEI"]
STD.SHRK = STD.ALL[SPECIES_CATEGORY_CODE %in% c("SHARKS", "RAYS")]
STD.OTHR = STD.ALL[SPECIES_CATEGORY_CODE ==     "OTHERS"]
STD.ETPS = STD.ALL[SPECIES_CATEGORY_CODE %in% c("CETACEANS", "SEABIRDS", "TURTLES")]

if(FALSE) {
  usethis::use_data(STD.TEMP, overwrite = TRUE)
  usethis::use_data(STD.TROP, overwrite = TRUE)
  usethis::use_data(STD.BILL, overwrite = TRUE)
  usethis::use_data(STD.NERI, overwrite = TRUE)
  usethis::use_data(STD.SEER, overwrite = TRUE)
  usethis::use_data(STD.TNEI, overwrite = TRUE)
  usethis::use_data(STD.SHRK, overwrite = TRUE)
  usethis::use_data(STD.OTHR, overwrite = TRUE)
  usethis::use_data(STD.ETPS, overwrite = TRUE)
}
