setwd("~/R/coursera/project1")

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric"))

data$DateTime<-paste(data$Date,data$Time)

data$DateTime<-strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")

data2<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

png(file="plot2.png",width=480,height=480)
plot(data2$DateTime,data2$Global_active_power,type="l",xlab=NA,ylab="Global Active Power (kilowatts)")
dev.off()
