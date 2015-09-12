##first script to plot3

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
png("plot3.png", width = 480, height = 480)
plot(data$date_time, data$Sub_metering_1, type = "l", col="black", xlab="",ylab="Energy sub metering")
lines(data$date_time, data$Sub_metering_2, type = "l", col = "red")
lines(data$date_time, data$Sub_metering_3, type = "l", col = "blue")
legend(x="topright",19.5, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c(1,2,3))
dev.off()
rm(list=ls())