data <- read.table("data.txt", na.strings = "?", skip = 66638, nrows =2880, sep = ";", header = FALSE)
header <- read.table("data.txt", header = F, nrows=1, sep =";")
names(data) <- unlist(header)

data$DT <- strptime(paste(data$Date, data$Time),format ="%d/%m/%Y %T")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
data$Time <- strptime(data$Time,"%T")

plot(data$DT, data$Global_active_power, type ="l",xlab="" ,ylab ="Global Active Power (kilowatts)")
dev.copy(png, file ="plot2.png", width=480, height=480)
dev.off()
