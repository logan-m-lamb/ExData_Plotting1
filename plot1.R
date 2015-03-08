source("getData.R")
library(dplyr)
library(lubridate)

# Download the data
data <- getData("file://exdata-data-household_power_consumption.zip")

# output file
png("plot1.png", width=480, height=480)

# Get all the information for February 1st and 2nd, 2007
d <- tbl_df(data) %>% mutate(Date=dmy(Date)) %>% filter(year(Date)==2007 & month(Date)==2 & mday(Date)<=2)

# plot it!
with(d, hist(Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power"))

# save the png file to plot1.png
dev.off()