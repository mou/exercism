two_fer <- function(input) {
  if (missing(input)) {
    "One for you, one for me."
  } else {
    sprintf("One for %s, one for me.", input)
  }
}
