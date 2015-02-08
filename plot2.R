# read file
power_data <- read.csv(file = './data/household_power_consumption.txt', sep = ';', na.strings = "?")

# convert date
power_data$Date <- strptime(power_data$Date, format = '%d/%m/%Y')

# using data from the dates 2007-02-01 and 2007-02-02
selected_data <- subset(power_data, subset = (Date >= '2007-02-01' & Date <= '2007-02-02'))

# convert date for selected_data
datetime <- paste(as.Date(selected_data$Date), selected_data$Time)
selected_data$Datetime <- as.POSIXct(datetime)

# plot 2
plot(selected_data$Global_active_power~selected_data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# save png
dev.copy(png, file = 'plot2.png', height = 480, width = 480)
dev.off()