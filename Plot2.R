# Coursera - Exploratory Data Analysis, Week 1 Assignment
# Created By Lee W.
#
file <- "C:/Users/Home/Documents/R/data/household_power_consumption.txt"
# After reviewing the data, the subset of data needed is 2,880 rows starting at row 66,638
# Read in the variable names to append onto the subset of data and put into a vector
col_names <- read.table(file, sep=";", na.strings="?", nrows=1)
names <- unname(unlist(col_names[1,]))
# Use the names vector with the col.names argument to provide variable names
power_data <- read.table(file, sep=";", na.strings="?",skip=66637, nrows=2880, col.names=names)
#
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
#
DateTime <- paste(as.Date(power_data$Date), power_data$Time)
power_data$DateTime <- as.POSIXct(DateTime)
#
#Plot 2:
#
with(power_data, plot(Global_active_power ~ DateTime, type="l", 
                      ylab="Global Acitve Power (kilowatts)", xlab=""))
#
# Save to png file:
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()



