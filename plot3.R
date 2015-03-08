source("getData.R")

# Download the data
data <- getData("file://exdata-data-household_power_consumption.zip")

# output file
png("plot3.png", width=480, height=480)

# Get all the information for February 1st and 2nd, 2007
d <- tbl_df(data) %>% 
  mutate(Date=dmy(Date)) %>% 
  filter(year(Date)==2007 & month(Date)==2 & mday(Date)<=2) %>% 
  mutate(day=Date+hms(Time))

# plot it!
with(d, {
  plot(day, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
  points(day, Sub_metering_2, col="red", type="l", xlab="", ylab="")
  points(day, Sub_metering_3, col="blue", type="l", xlab="", ylab="")
  legend("topright", lty=1, col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# save the png file to plot1.png
dev.off()