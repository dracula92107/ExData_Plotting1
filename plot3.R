# read file
power_data <- read.csv(file = "./data/household_power_consumption.txt", sep = ";", na.strings = "?")

# convert date
power_data$Date <- strptime(power_data$Date, format = "%d/%m/%Y")

# using data from the dates 2007-02-01 and 2007-02-02
selected_data <- subset(power_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert date for selected_data
datetime <- paste(as.Date(selected_data$Date), selected_data$Time)
selected_data$Datetime <- as.POSIXct(datetime)

# plot 3
with(selected_data, {
plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(Sub_metering_2~Datetime, col = "red")
lines(Sub_metering_3~Datetime, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# save png
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()