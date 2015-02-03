#Exploratory Data Analysis, Assignment 1, Part 4

#set working directory and file name
setwd("F:/mooc/dstrack/04_exploratory_data_analysis/ExData_Plotting1")
filename <- "household_power_consumption.txt"

#read data into memory
df <- read.table(filename, header = TRUE, sep = ";", na = "?")

# create a logical vector of rows within the specified dates
relevantDates <- df$Date == "1/2/2007" | df$Date == "2/2/2007"

#subset data frame so only relevant rows are kept
df <- df[relevantDates,]

#create a unified column containing Date and Time; store in Date column
df$newDate <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

#create 4-panel graphic as a PNG file
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg="transparent")

#set panel size to 2x2
par(mfrow = c(2, 2))

#create upper left graph
plot(df$newDate, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#create upper right graph
plot(df$newDate, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#create lower left graph
plot(df$newDate, df$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(df$newDate, df$Sub_metering_2, col = "red")
lines(df$newDate, df$Sub_metering_3, col = "blue")

#create legend for lower left graph
legend("topright", bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

#create lower right graph
plot(df$newDate, df$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()