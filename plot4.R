#Code to produce plot 4.
#Data file was downloaded to local drive and read into R fully due to memory requirements being well under 1 Gb.

library(dplyr)

setwd("H:/Coursera/Exploratory_data_analysis/Assignment1")
df1 <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?", stringsAsFactors = FALSE)

#select dates 2007-02-01 and 2007-02-02
df2 <- filter(df1, Date == "1/2/2007" | Date == "2/2/2007")

#put date and times into POSIXlt format:
df2$Date_Time <- paste(df2$Date, df2$Time, sep=' ')
df2$Date_Time <- strptime(Date_Time, format="%d/%m/%Y %H:%M:%S")
df2$Day <- weekdays(as.Date(df2$Date_Time), abbreviate = TRUE)

#plot4
png(file = "./ExData_Plotting1/plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(df2$Date_Time, df2$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(df2$Date_Time, df2$Global_active_power)

plot(df2$Date_Time, df2$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(df2$Date_Time, df2$Voltage)

plot(df2$Date_Time, df2$Sub_metering_1, type = "n", xlab = '', ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", col = c("black", "red", "blue"), lty= c(1,1,1))
lines(df2$Date_Time, df2$Sub_metering_1)
lines(df2$Date_Time, df2$Sub_metering_2, col = "red")
lines(df2$Date_Time, df2$Sub_metering_3, col = "blue")

plot(df2$Date_Time, df2$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(df2$Date_Time, df2$Global_reactive_power)

dev.off()
