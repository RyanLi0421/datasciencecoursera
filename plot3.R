epower <- read.table(file = 'household_power_consumption.txt',sep = ';',header = T, na.strings = '?')
epower$Date <- as.Date(epower$Date, '%d/%m/%Y')
epower_dat <- epower[(epower$Date >= "2007-02-01" & epower$Date <= "2007-02-02"),]
epower_dat <- transform(epower_dat, dt = strptime(paste(Date, Time), '%Y-%m-%d %H:%M:%S'))

png(filename = 'plot3.png')
plot(epower_dat$dt,epower_dat$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(epower_dat$dt,epower_dat$Sub_metering_2, col = 'red')
lines(epower_dat$dt,epower_dat$Sub_metering_3, col = 'blue')
legend('topright', lty = 1, col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3') )
dev.off()