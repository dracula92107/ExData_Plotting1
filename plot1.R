#read file
power_data <- read.csv(file = './data/household_power_consumption.txt', sep = ';', na.strings = "?")

#convert date
power_data$Date <- strptime(power_data$Date, format = '%d/%m/%Y')

# using data from the dates 2007-02-01 and 2007-02-02
selected_data <- subset(power_data, subset=(Date >= '2007-02-01' & Date <= '2007-02-02'))

# plot 1
hist(selected_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# save png
dev.copy(png, file = 'plot1.png', height = 480, width = 480)
dev.off()