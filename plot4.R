data <- read.table("data.txt", na.strings = "?", skip = 66638, nrows =2880, sep = ";", header = FALSE)
header <- read.table("data.txt", header = F, nrows=1, sep =";")
names(data) <- unlist(header)

data$Time <- strptime(paste(data$Date, data$Time),format ="%d/%m/%Y %T")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")

par(mfrow = c(2,2))
plot(data$Time, data$Global_active_power, type ="l",xlab="" ,ylab ="Global Active Power (kilowatts)")

plot(data$Time, data$Voltage, type ="l",xlab="datetime" ,ylab ="Voltage")


plot(data$Time, data$Sub_metering_1, type ="l", xlab ="", ylab ="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright",bty="n", lwd=1,col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$Time, data$Global_reactive_power, type ="l",xlab="datetime" ,ylab ="Global_reactive_power")
dev.copy(png, file ="plot4.png", width=480, height=480)
dev.off()