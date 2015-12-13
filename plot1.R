# Read the entire dataset
dataset <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Add column DateTime transforming Date and Time variables to Date/Time classes 
dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset the period from 2007-02-01 to 2007-02-02
subdt <- subset(dataset, as.Date(dataset$DateTime) >= '2007-02-01' & 
                    as.Date(dataset$DateTime) <= '2007-02-02')

# Create the png file containing the plot
png(file = "plot1.png", units = "px", width = 480, height = 480)
hist(subdt$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
