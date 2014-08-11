data <- read.table("../household_power_consumption.txt",header= TRUE,sep=";",na.strings="?")

data2 <- data

data2$Date <- as.Date(data2$Date,format= "%d/%m/%Y")
data2$Time <- strptime(data2$time)




myData <- subset(data2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(myData$Date, myData$Time)
myData$Datetime <- as.POSIXct(datetime)




par(mfrow = c(2,2))

plot(myData$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(myData$Voltage,type="l",xlab="datetime",ylab="Voltage")


plot(myData$Datetime,myData$Sub_metering_1,col="black", type="l",xlab="",ylab="Energy sub metering")
lines(myData$Datetime,myData$Sub_metering_2,col="red")
lines(myData$Datetime,myData$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1),col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex=0.5)


plot(myData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")


dev.copy(png, file = "plot4.png",height=480, width=480)
dev.off()
