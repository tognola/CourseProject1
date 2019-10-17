data <- read.table("data.txt", na.strings = "?", skip = 66638, nrows =2880, sep = ";", header = FALSE)
header <- read.table("data.txt", header = F, nrows=1, sep =";")
names(data) <- unlist(header)

data$DT <- strptime(paste(data$Date, data$Time),format ="%d/%m/%Y %T")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
data$Time <- strptime(data$Time,"%T")

plot(data$DT, data$Sub_metering_1, type ="l", xlab ="", ylab ="Energy sub metering")
lines(data$DT, data$Sub_metering_2, col="red")
lines(data$DT, data$Sub_metering_3, col="blue")
legend("topright", adj=0, lwd=1,col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file ="plot3.png", width=480, height=480)
dev.off()
