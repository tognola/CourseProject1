
data <- read.table("data.txt", na.strings = "?", skip = 66638, nrows =2880, sep = ";", header = FALSE)
header <- read.table("data.txt", header = F, nrows=1, sep =";")
names(data) <- unlist(header)
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
data$Time <- strptime(data$Time,"%T")
hist(data$Global_active_power, main="Global Active Power", xlab ="Global Active Power (kilowatts)", col ="red")
dev.copy(png, file ="plot1.png", width=480, height=480)
dev.off()

