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
#Plot 3:
#
with(power_data, plot(Sub_metering_1 ~ DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(power_data, lines(Sub_metering_2 ~ DateTime, col="red"))
with(power_data, lines(Sub_metering_3 ~ DateTime, col="blue"))
legend("topright", col=c("black","red","blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#
# Save to png file:
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()



