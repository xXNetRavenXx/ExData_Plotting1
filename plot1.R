EnergyUsage <- read.table("household_power_consumption.txt", na.strings= "?", sep = ";",
                          header = TRUE,stringsAsFactors = FALSE ,
                          dec = ".")


EnergyUsage$Date <- as.Date(EnergyUsage$Date, format= "%d/%m/%Y" )
EnergyUsage$Time <- strptime(EnergyUsage$Time, format = "%H:%M:%S")
EnergyUsage$Time <- as.numeric(EnergyUsage$Time - trunc(EnergyUsage$Time, "days"))

EnergyUsageDay <- EnergyUsage[EnergyUsage$Date == "2007-02-01" | EnergyUsage$Date == "2007-02-02",]

hist(EnergyUsageDay$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)"
     , ylab= "Frequency",ylim=c(0,1300),main ="Global Active Power")
