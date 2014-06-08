EnergyUsage <- read.table("household_power_consumption.txt", na.strings= "?", sep = ";",
                          header = TRUE,stringsAsFactors = FALSE ,
                          dec = ".")

EnergyUsage$Time <- as.POSIXct( strptime(paste(EnergyUsage$Date, EnergyUsage$Time), "%d/%m/%Y %H:%M:%S")) 
EnergyUsage$Date <-  as.Date(EnergyUsage$Date, format= "%d/%m/%Y")

EnergyUsageDay <- EnergyUsage[EnergyUsage$Date == "2007-02-01" | EnergyUsage$Date == "2007-02-02",] 

plot(EnergyUsageDay$Time,EnergyUsageDay$Global_active_power,type = "l", xlab = "",ylab="Global Active Power (kilowatts)") 

dev.copy(png, file = "../ExData_Plotting1/plot2.png")
dev.off()