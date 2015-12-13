# read whole data
library(data.table)
dat = fread('./household_power_consumption.txt', na.strings='?')


# subset required data
sdat = dat[Date == '1/2/2007' | Date == '2/2/2007', ]


# get information
global_active_power = sdat$Global_active_power
sub_metering_1 = sdat$Sub_metering_1
sub_metering_2 = sdat$Sub_metering_2
sub_metering_3 = sdat$Sub_metering_3
voltage = sdat$Voltage
global_reactive_power = sdat$Global_reactive_power
time_axis = strptime(paste(sdat$Date, sdat$Time, sep=' '), '%d/%m/%Y %H:%M:%S')


# plot the figure
png('plot4.png', width=480, height=480)
par(mfcol=c(2,2))

plot(time_axis, global_active_power, xlab='', ylab='Global Active Power', type='l')

plot(time_axis, sub_metering_1, xlab='', ylab='Energy sub metering', type='l')
lines(time_axis, sub_metering_2, col='red', type='l')
lines(time_axis, sub_metering_3, col='blue', type='l')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1,  col=c('black', 'red', 'blue'), bty='n')

plot(time_axis, voltage, xlab='datetime', ylab='Voltage', type='l')

plot(time_axis, global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

dev.off()
