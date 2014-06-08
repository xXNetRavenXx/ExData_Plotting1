EnergyUsage <- read.table("household_power_consumption.txt", na.strings= "?", sep = ";",
                          header = TRUE,stringsAsFactors = FALSE ,
                          dec = ".")

EnergyUsage$Time <- as.POSIXct( strptime(paste(EnergyUsage$Date, EnergyUsage$Time), "%d/%m/%Y %H:%M:%S")) 
EnergyUsage$Date <-  as.Date(EnergyUsage$Date, format= "%d/%m/%Y")  

EnergyUsageDay <- EnergyUsage[EnergyUsage$Date == "2007-02-01" | EnergyUsage$Date == "2007-02-02",] 


par(mfrow = c(2, 2))
with(EnergyUsageDay,{
    plot(EnergyUsageDay$Time,EnergyUsageDay$Global_active_power,type = "l",ylab = "Global Active Power",xlab="")
    
    plot(EnergyUsageDay$Time,EnergyUsageDay$Voltage,type = "l",ylab = "Voltage",xlab="")
    
    plot(EnergyUsageDay$Time,EnergyUsageDay$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab="")
    points(EnergyUsageDay$Time,EnergyUsageDay$Sub_metering_2,type = "l",col="red")
    points(EnergyUsageDay$Time,EnergyUsageDay$Sub_metering_3,type = "l",col="blue")
    legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6,, bty = "n")
    
    plot(EnergyUsageDay$Time,EnergyUsageDay$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab="")
} )
dev.copy(png, file = "../ExData_Plotting1/plot4.png")
dev.off()