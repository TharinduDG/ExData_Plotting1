
library(dplyr)

data = read.csv("R_Workspace/R_data/coursera/household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, header=TRUE, na.strings="?")
data = tbl_df(data)

power_feb = filter(data,Date %in% c("1/2/2007","2/2/2007")) 

hist(as.numeric(as.character(power_feb$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, filename = "C:\\Users\\tharindu\\Documents\\GitHub\\ExData_Plotting1\\plot1.png", width = 480, height = 480)
dev.off()
  
