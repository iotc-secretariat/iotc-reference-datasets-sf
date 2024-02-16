#' Returns a dataset containing raw size-frequency data for all categories of species
#' @export
SF.RAW.all = function() {
  return(
    rbind(
      SF.RAW.TEMP,
      SF.RAW.TROP,
      SF.RAW.BILL,
      SF.RAW.NERI,
      SF.RAW.SEER,
      SF.RAW.TNEI,
      SF.RAW.SHRK,
      SF.RAW.ETPS,
      SF.RAW.OTHR
    )
  )
}
