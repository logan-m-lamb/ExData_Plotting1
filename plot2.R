source("getData.R")
library(dplyr)
library(lubridate)

# Download the data
data <- getData("file://exdata-data-household_power_consumption.zip")

# output file
png("plot2.png", width=480, height=480)

# Get all the information for February 1st and 2nd, 2007
d <- tbl_df(data) %>% 
  mutate(Date=dmy(Date)) %>% 
  filter(year(Date)==2007 & month(Date)==2 & mday(Date)<=2) %>% 
  mutate(day=Date+hms(Time))

# plot it!
with(d, plot(day, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# save the png file to plot1.png
dev.off()