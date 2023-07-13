library(iotc.base.common.data)
library(iotc.base.common.std)

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

SF_STD_ALL = standardize(SF_RAW_ALL)
usethis::use_data(SF_STD_ALL, overwrite = TRUE)

SF_STD_TEMP = SF_STD_ALL[SPECIES_CATEGORY_CODE ==     "TEMPERATE"]
SF_STD_TROP = SF_STD_ALL[SPECIES_CATEGORY_CODE ==     "TROPICAL"]
SF_STD_BILL = SF_STD_ALL[SPECIES_CATEGORY_CODE ==     "BILLFISH"]
SF_STD_NERI = SF_STD_ALL[SPECIES_CATEGORY_CODE ==     "NERITIC"]
SF_STD_SEER = SF_STD_ALL[SPECIES_CATEGORY_CODE ==     "SEERFISH"]
SF_STD_TNEI = SF_STD_ALL[SPECIES_CATEGORY_CODE ==     "TUNAS_NEI"]
SF_STD_SHRK = SF_STD_ALL[SPECIES_CATEGORY_CODE %in% c("SHARKS", "RAYS")]
SF_STD_OTHR = SF_STD_ALL[SPECIES_CATEGORY_CODE ==     "OTHERS"]
SF_STD_ETPS = SF_STD_ALL[SPECIES_CATEGORY_CODE %in% c("CETACEANS", "SEABIRDS", "TURTLES")]

if(FALSE) {
  usethis::use_data(SF_STD_TEMP, overwrite = TRUE)
  usethis::use_data(SF_STD_TROP, overwrite = TRUE)
  usethis::use_data(SF_STD_BILL, overwrite = TRUE)
  usethis::use_data(SF_STD_NERI, overwrite = TRUE)
  usethis::use_data(SF_STD_SEER, overwrite = TRUE)
  usethis::use_data(SF_STD_TNEI, overwrite = TRUE)
  usethis::use_data(SF_STD_SHRK, overwrite = TRUE)
  usethis::use_data(SF_STD_OTHR, overwrite = TRUE)
  usethis::use_data(SF_STD_ETPS, overwrite = TRUE)
}
