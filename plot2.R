
setwd('G:\\cousera\\exdata2Fdata2Fhousehold_power_consumption\\')
daat <- read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
names(daat)

#plot2
library(base)
x <- daat$Global_active_power[daat$Date == '1/2/2007' | daat$Date == '2/2/2007']
png(filename = "plot2.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white", res = NA,restoreConsole = TRUE)
plot(x,type='l',ylab='Global Active Power (kilowatts)',xlab='',xaxt='n')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()