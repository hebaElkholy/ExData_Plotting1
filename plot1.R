data <- read.table("../household_power_consumption.txt",header= TRUE,sep=";")

data2 <- data

data2$Date <- as.Date(data2$Date,format= "%d/%m/%Y")
data2$Time <- strptime(data2$time)


myData<-data2[data2$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

myData[myData$Global_active_power=="?"]<-NA

globalPower[globalPower=="?"]<-NA


hist(as.numeric(myData$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
