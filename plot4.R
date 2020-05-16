library(dplyr)
library(tidyr)
pow <- read.delim("household_power_consumption.txt",sep=";")

pow$Date <- as.Date(pow$Date,"%d/%m/%Y")
pow <- subset(pow,pow$Date>='2007-02-01'&pow$Date<='2007-02-02')
pow <- subset(pow,pow$Sub_metering_1!='?'&pow$Sub_metering_2!='?'&pow$Sub_metering_3!='?')

pow$Global_active_power <- as.numeric(pow$Global_active_power)
pow$Global_active_power <- pow$Global_active_power/1000

pow$Global_reactive_power <- as.numeric(pow$Global_reactive_power)
pow$Global_reactive_power <- pow$Global_reactive_power/1000

pow$Sub_metering_1 <- as.numeric(pow$Sub_metering_1)
pow$Sub_metering_2 <- as.numeric(pow$Sub_metering_2)
pow$Sub_metering_3 <- as.numeric(pow$Sub_metering_3)

pow$Voltage <- as.numeric(pow$Voltage)

par(mfrow=c(2,2))

plot(pow$Time,pow$Global_active_power,type = 'l',xlab="Time",ylab = "Global Active power (kilowatts)")

plot(pow$Time,pow$Voltage,type = 'l',xlab="Time",ylab = "Voltage")


plot(pow$Time,pow$Sub_metering_1,xlab="Time",ylab = "Energy sub metering")
lines(pow$Time,pow$Sub_metering_2,col='red')
lines(pow$Time,pow$Sub_metering_3,col='blue')
legend(1000,32,legend=c("Sub metering 1", "Sub metering 2","Sub metering 3"),
       col=c("black", "red",'blue'), cex=0.4)

plot(pow$Time,pow$Global_reactive_power,type = 'l',xlab="Time",ylab = "Global Reactive power (kilowatts)")
