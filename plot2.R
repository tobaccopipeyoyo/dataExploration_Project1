##first script to plot2

prelimData <- read.table("household_power_consumption.txt", colClasses = "character", sep = ";", header = T)
#need a coalesced column for date and time
prelimData$date_time <- paste(prelimData$Date, prelimData$Time, sep=" ")
prelimData$Date <- as.Date(prelimData$Date, format = "%d/%m/%Y")
day1 <- as.Date("2007-02-01")
day2 <- as.Date("2007-02-02")
#get day index for filtering results
dayIndex <- (prelimData$Date==day1) | (prelimData$Date==day2)
#filtering data
data <- prelimData[dayIndex,]
date_time <- paste(prelimData$Date, prelimData$Time, sep=" ")
date_time <- date_time[dayIndex]
date_time <- strptime(date_time, format = "%Y-%m-%d %H:%M:%S")
data$date_time <- date_time
rm(date_time)
png("plot2.png", width = 480, height = 480)
plot(data$date_time, data$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
rm(list=ls())