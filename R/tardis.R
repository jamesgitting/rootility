#' Parses a supplied date/time column to new columns of individual
#' temporal elements for additional manipulation.
#'
#' @export
#'
#' @param my.df Data frame
#' @param my.df.col Column with date time values of class POSIX.
#'
#' @return my.df. Essentially cbinds original data frame with temporal data.
#'
#' @family temporal_functions

parse_datetime <- function(my.df, my.df.col){

  my_date_time <- substitute(mutate(my.df,
                                    date = as.Date(my.df.col, format = "%x"),
                                    year = as.numeric(format(my.df.col, "%Y")),
                                    month_of_year = factor(format(my.df.col, "%B"),
                                                           levels = c('January',
                                                                      'February',
                                                                      'March',
                                                                      'April',
                                                                      'May',
                                                                      'June',
                                                                      'July',
                                                                      'August',
                                                                      'September',
                                                                      'October',
                                                                      'November',
                                                                      'December')),
                                    week_of_year = as.numeric(format(my.df.col, "%W")),
                                    day_of_year = as.numeric(format(my.df.col, "%j")),
                                    day_of_month = as.numeric(format(my.df.col, "%d")),
                                    day_of_week = factor(format(my.df.col, "%A"),
                                                         levels = c('Sunday',
                                                                    'Monday',
                                                                    'Tuesday',
                                                                    'Wednesday',
                                                                    'Thursday',
                                                                    'Friday',
                                                                    'Saturday')),
                                    hour = as.numeric(format(my.df.col, "%H")),
                                    minute = as.numeric(format(my.df.col, "%M")),
                                    second = as.numeric(format(my.df.col, "%S"))),
                             list(my.df.col = as.name(my.df.col)))

  mutated_df <- eval(my_date_time)

  return(mutated_df)
}
