
library(dplyr)

data = read.csv("R_Workspace/R_data/coursera/household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
data = tbl_df(data)

power_feb = filter(data,Date %in% c("1/2/2007","2/2/2007")) 

power_feb$DateTime <- strptime(paste(power_feb$Date,power_feb$Time),"%d/%m/%Y %H:%M:%S")
plot(power_feb$DateTime, power_feb$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=NA)

dev.copy(png, filename = "C:\\Users\\tharindu\\Documents\\GitHub\\ExData_Plotting1\\plot2.png", width = 480, height = 480)
dev.off()
