data <- read.table("../household_power_consumption.txt",header= TRUE,sep=";",na.strings="?")

data2 <- data

data2$Date <- as.Date(data2$Date,format= "%d/%m/%Y")
data2$Time <- strptime(data2$time)


myData <- subset(data2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))



hist(myData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")


dev.copy(png, file = "plot1.png",height=480, width=480)
dev.off()



