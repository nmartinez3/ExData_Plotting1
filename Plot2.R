rm(list=ls())
data<-file(description="C:/Users/yaboiii6969_420/Documents/household_power_consumption.txt",open="r")
Power<-read.table(data,header=T,sep=";",na.strings="?")
Power$Date<-as.Date(Power$Date,format="%d/%m/%Y")
good<-Power$Date=="2007-02-01"|Power$Date=="2007-02-02"
Power<-Power[good,]
Power$Time<-paste(Power$Date,Power$Time,sep=" ")
Power$Time<-strptime(Power$Time,format="%Y-%m-%d %H:%M:%S")
png(filename="Plot2.png",width=480,height=480,units="px")
plot(Power$Time,Power$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts")
dev.off()