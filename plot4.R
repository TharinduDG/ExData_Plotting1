library(dplyr)

data = read.csv("R_Workspace/R_data/coursera/household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
data = tbl_df(data)
power_feb = filter(data,Date %in% c("1/2/2007","2/2/2007"))

power_feb$DateTime <- strptime(paste(power_feb$Date,power_feb$Time),"%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))

plot(power_feb$DateTime, power_feb$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

plot(power_feb$DateTime, power_feb$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(power_feb$DateTime, power_feb$Sub_metering_2, col="red")
lines(power_feb$DateTime, power_feb$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2, cex=0.4)

plot(power_feb$DateTime, power_feb$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(power_feb$DateTime, power_feb$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, filename = "C:\\Users\\tharindu\\Documents\\GitHub\\ExData_Plotting1\\plot4.png", width = 480, height = 480)
dev.off()