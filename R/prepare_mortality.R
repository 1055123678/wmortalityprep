#' Reshape World Bank mortality data
#'
#' Converts World Bank mortality data from wide format, where years are
#' stored in columns such as X2000, X2001, and X2002, into long format.
#'
#' @param data A data frame containing World Bank mortality data.
#' @param value_name A character string specifying the name of the
#'   mortality value column in the output.
#'
#' @return A data frame in long format with a numeric `year` column.
#'
#' @examples
#' prepare_mortality(maternal_mortality, "maternal_mortality")
#'
#' @export
prepare_mortality <- function(data, value_name) {

  data |>
    tidyr::pivot_longer(
      cols = dplyr::starts_with("X"),
      names_to = "year",
      values_to = value_name
    ) |>
    dplyr::mutate(
      year = as.integer(sub("X", "", year))
    )
}