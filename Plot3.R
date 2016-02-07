rm(list=ls())
data<-file(description="C:/Users/yaboiii6969_420/Documents/household_power_consumption.txt",open="r")
Power<-read.table(data,header=T,sep=";",na.strings="?")
Power$Date<-as.Date(Power$Date,format="%d/%m/%Y")
good<-Power$Date=="2007-02-01"|Power$Date=="2007-02-02"
Power<-Power[good,]
Power$Time<-paste(Power$Date,Power$Time,sep=" ")
Power$Time<-strptime(Power$Time,format="%Y-%m-%d %H:%M:%S")
png(filename="Plot3.png",width=480,height=480,units="px")
plot(Power$Time,Power$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(Power$Time,Power$Sub_metering_2,type="l",col="red")
lines(Power$Time,Power$Sub_metering_3,type="l",col="blue")
legend("topright",pch="_",col=c("black","blue","red"),legend=c("sub metering 1","sub metering 2","sub metering 3"))
dev.off()