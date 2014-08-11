data <- read.table("../household_power_consumption.txt",header= TRUE,sep=";",na.strings="?")

data2 <- data

data2$Date <- as.Date(data2$Date,format= "%d/%m/%Y")
data2$Time <- strptime(data2$time)


myData <- subset(data2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


plot(myData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png",height=480, width=480)
dev.off()

