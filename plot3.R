setwd("~/R/coursera/project1")

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric"))

data$DateTime<-paste(data$Date,data$Time)

data$DateTime<-strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")

data2<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

png(file="plot3.png",width=480,height=480)
plot(data2$DateTime,data2$Sub_metering_1,type="l",xlab=NA,ylab="Energy sub metering")
lines(data2$DateTime,data2$Sub_metering_2,col="red")
lines(data2$DateTime,data2$Sub_metering_3,col="blue")
legend("topright",legend=names(data2)[c(7,8,9)],col=c("black","red","blue"),lty=1,lwd=1)
dev.off()
