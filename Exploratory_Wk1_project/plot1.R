setwd('G:\\cousera\\exdata2Fdata2Fhousehold_power_consumption\\')
daat <- read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
names(daat)

#plot1
library(base)
x <- daat$Global_active_power[daat$Date == '1/2/2007' | daat$Date == '2/2/2007']
png(filename = "plot1.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white", res = NA,restoreConsole = TRUE)
hist(x,freq=TRUE,col='red',xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
#dev.copy(png,'plot1.png')
dev.off()



