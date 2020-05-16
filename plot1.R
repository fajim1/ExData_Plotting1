library(dplyr)
library(tidyr)
pow <- read.delim("household_power_consumption.txt",sep=";")

pow$Date <- as.Date(pow$Date,"%d/%m/%Y")
pow <- subset(pow,pow$Date>='2007-02-01'&pow$Date<='2007-02-02')
pow$Global_active_power <- as.numeric(pow$Global_active_power)
pow$Global_active_power <- pow$Global_active_power/1000
hist(pow$Global_active_power,xlab = "Global Active power (kilowatts)",breaks=15)
