#Exploratory Data Analysis, Assignment 1, Part 1

#set working directory and file name
setwd("F:/mooc/dstrack/04_exploratory_data_analysis/ExData_Plotting1")
filename <- "household_power_consumption.txt"

#read data into memory
df <- read.table(filename, header = TRUE, sep = ";", na = "?")

# create a logical vector of rows within the specified dates
relevantDates <- df$Date == "1/2/2007" | df$Date == "2/2/2007"

#subset data frame so only relevant rows are kept
df <- df[relevantDates,]

#create histogram of 'global active power' as a PNG file
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg="transparent")
hist(df$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     breaks = 12, 
     ylim = c(0, 1200))
dev.off()