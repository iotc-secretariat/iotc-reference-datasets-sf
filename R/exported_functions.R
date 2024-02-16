#' Returns a dataset containing raw size-frequency data for all categories of species
#' @export
RAW.all = function() {
  return(
    rbind(
      RAW.TEMP,
      RAW.TROP,
      RAW.BILL,
      RAW.NERI,
      RAW.SEER,
      RAW.TNEI,
      RAW.SHRK,
      RAW.ETPS,
      RAW.OTHR
    )
  )
}
