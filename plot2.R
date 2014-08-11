

data <- read.table("../household_power_consumption.txt",header= TRUE,sep=";")

data2 <- data

data2$Date <- as.Date(data2$Date,format= "%d/%m/%Y")
data2$Time <- strptime(data2$time)


myData<-data2[data2$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

myData[myData$Global_active_power=="?"]<-NA

globalPower<-myData[["Global_active_power"]]
globalPower[globalPower=="?"]<-NA??




plot(myData$Date,as.numeric(paste(myData$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()

