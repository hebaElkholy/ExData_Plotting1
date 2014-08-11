data <- read.table("../household_power_consumption.txt",header= TRUE,sep=";")

data2 <- data

data2$Date <- as.Date(data2$Date,format= "%d/%m/%Y")
data2$Time <- strptime(data2$time)


myData<-data2[data2$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

myData[myData$Global_active_power=="?"]<-NA

globalPower<-myData[["Global_active_power"]]
globalPower[globalPower=="?"]<-NA



plot(myData$Date,as.numeric(paste(myData$Sub_metering_1)),col="black", type="l",xlab="",ylab="Energy sub metering")
lines(myData$Date,as.numeric(paste(myData$Sub_metering_2)),col="red")
lines(myData$Date,as.numeric(paste(myData$Sub_metering_2)),col="blue")
legend("topright", lty=c(1,1,1),col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


dev.copy(png, file = "plot3.png")
dev.off()
