#Exploratory Data Analysis, Assignment 1, Part 2

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

#create a line graph of 'global active power' as a PNG file
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg="transparent")
plot(df$newDate, 
     df$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()