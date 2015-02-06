#Code to produce plot 3.
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

#plot 3
png(file = "./ExData_Plotting1/plot3.png", width = 480, height = 480)
plot(df2$Date_Time, df2$Sub_metering_1, type = "n", xlab = '', ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty= c(1,1,1))
lines(df2$Date_Time, df2$Sub_metering_1)
lines(df2$Date_Time, df2$Sub_metering_2, col = "red")
lines(df2$Date_Time, df2$Sub_metering_3, col = "blue")
dev.off()