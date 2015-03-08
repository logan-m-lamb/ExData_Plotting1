getData <- function(url = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip") {
  temp_file <- tempfile()
  download.file(url, temp_file)
  csv_file <- unz(temp_file, "household_power_consumption.txt")
  data <- read.csv(csv_file, sep=";", na.string="?")
  unlink(temp_file)
  data
}