#' Returns a dataset containing raw size-frequency data for all categories of species
#' @export
all = function() {
  return(
    rbind(
      RAW.BET,
      RAW.SKJ,
      RAW.YFT,
      RAW.TEMP,
      RAW.BILL,
      RAW.NERI,
      RAW.SEER,
      RAW.TNEI,
      RAW.SHRK,
      RAW.OTHR,
      RAW.ETPS
    )
  )
}
