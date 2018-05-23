epower <- read.table(file = 'household_power_consumption.txt',sep = ';',header = T, na.strings = '?')
epower$Date <- as.Date(epower$Date, '%d/%m/%Y')
epower_dat <- epower[(epower$Date >= "2007-02-01" & epower$Date <= "2007-02-02"),]
epower_dat <- transform(epower_dat, dt = strptime(paste(Date, Time), '%Y-%m-%d %H:%M:%S'))

png(filename = 'plot2.png')
plot(epower_dat$dt,epower_dat$Global_active_power, type = 'l', xlab = '', ylab = 'Global active power(kilowatts)')
dev.off()