epower <- read.table(file = 'household_power_consumption.txt',sep = ';',header = T, na.strings = '?')
epower$Date <- as.Date(epower$Date, '%d/%m/%Y')
epower_dat <- epower[(epower$Date >= "2007-02-01" & epower$Date <= "2007-02-02"),]
epower_dat <- transform(epower_dat, dt = strptime(paste(Date, Time), '%Y-%m-%d %H:%M:%S'))

png(filename = 'plot1.png')
hist(epower_dat$Global_active_power, col = 'red', xlab = 'Global active power(kilowatts)', main = 'Global Active Power')
dev.off()