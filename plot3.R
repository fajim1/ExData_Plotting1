library(dplyr)
library(tidyr)
pow <- read.delim("household_power_consumption.txt",sep=";")

pow$Date <- as.Date(pow$Date,"%d/%m/%Y")
pow <- subset(pow,pow$Date>='2007-02-01'&pow$Date<='2007-02-02')
pow <- subset(pow,pow$Sub_metering_1!='?'&pow$Sub_metering_2!='?'&pow$Sub_metering_3!='?')

pow$Sub_metering_1 <- as.numeric(pow$Sub_metering_1)
pow$Sub_metering_2 <- as.numeric(pow$Sub_metering_2)
pow$Sub_metering_3 <- as.numeric(pow$Sub_metering_3)


plot(pow$Time,pow$Sub_metering_1,xlab="Time",ylab = "Energy sub metering")
lines(pow$Time,pow$Sub_metering_2,col='red')
lines(pow$Time,pow$Sub_metering_3,col='blue')
legend(1000,32,legend=c("Sub metering 1", "Sub metering 2","Sub metering 3"),
       col=c("black", "red",'blue'), lty=1:2, cex=0.8)

