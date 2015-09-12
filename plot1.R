##first script to plot1

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
global_activePower <- as.numeric(data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(global_activePower, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
rm(list = ls())