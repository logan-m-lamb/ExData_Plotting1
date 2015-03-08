source("getData.R")

# Download the data
data <- getData("file://exdata-data-household_power_consumption.zip")

# output file
png("plot4.png", width=480, height=480)

# Get all the information for February 1st and 2nd, 2007
d <- tbl_df(data) %>% 
  mutate(Date=dmy(Date)) %>% 
  filter(year(Date)==2007 & month(Date)==2 & mday(Date)<=2) %>% 
  mutate(day=Date+hms(Time))

# plot it!

par(mfrow = c(2,2))
with(d, {
  # 1
  plot(day, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  # 2
  plot(day, Voltage, type="l", xlab="datetime", ylab="Voltage")
  # 3
  plot(day, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
  points(day, Sub_metering_2, col="red", type="l", xlab="", ylab="")
  points(day, Sub_metering_3, col="blue", type="l", xlab="", ylab="")
  legend("topright", lty=1, col=c("black", "red", "blue"), bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # 4
  plot(day, Global_reactive_power, type="l", xlab="datetime")
})

# save the png file to plot1.png
dev.off()