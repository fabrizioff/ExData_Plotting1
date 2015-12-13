# Read the entire dataset
dataset <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Add column DateTime transforming Date and Time variables to Date/Time classes 
dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset the period from 2007-02-01 to 2007-02-02
subdt <- subset(dataset, as.Date(dataset$DateTime) >= '2007-02-01' & 
                    as.Date(dataset$DateTime) <= '2007-02-02')

# Create the png file containing the plot
png(file = "plot3.png", units = "px", width = 480, height = 480)
plot(subdt$DateTime, subdt$Sub_metering_1, type="l", col = "black", xlab = "", 
     ylab = "Energy sub metering")
lines(subdt$DateTime, subdt$Sub_metering_2, col="red")
lines(subdt$DateTime, subdt$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


