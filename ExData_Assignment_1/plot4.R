
setwd('G:\\cousera\\exdata2Fdata2Fhousehold_power_consumption\\')
daat <- read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
names(daat)

#plot4
library(base)
x <- daat$Global_active_power[daat$Date == '1/2/2007' | daat$Date == '2/2/2007']
volt <- daat$Voltage[daat$Date == '1/2/2007' | daat$Date == '2/2/2007']
global.reactive <- daat$Global_reactive_power[daat$Date == '1/2/2007' | daat$Date == '2/2/2007']
sub1 <- daat$Sub_metering_1[daat$Date == '1/2/2007' | daat$Date == '2/2/2007']
sub2 <- daat$Sub_metering_2[daat$Date == '1/2/2007' | daat$Date == '2/2/2007']
sub3 <- daat$Sub_metering_3[daat$Date == '1/2/2007' | daat$Date == '2/2/2007']
png(filename = "plot4.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white", res = NA,restoreConsole = TRUE)
par(mfrow=c(2,2))
plot(x,type='l',ylab='Global Active Power (kilowatts)',xlab='',xaxt='n')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
plot(volt,type='l',ylab='Voltage',xlab='datetime',xaxt='n')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
plot(sub1,col='black',type='l',ylab='Energy sub metering',xlab='',xaxt='n')
lines(sub2,col='red',type='l')
lines(sub3,col='blue',type='l')
legend("topright", lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
plot(global.reactive,type='l',ylab='Global_reactive_power',xlab='datetime',xaxt='n')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()