# read whole data
library(data.table)
dat = fread('./household_power_consumption.txt', na.strings='?')


# subset required data
sdat = dat[Date == '1/2/2007' | Date == '2/2/2007', ]


# get information
sub_metering_1 = sdat$Sub_metering_1
sub_metering_2 = sdat$Sub_metering_2
sub_metering_3 = sdat$Sub_metering_3
time_axis = strptime(paste(sdat$Date, sdat$Time, sep=' '), '%d/%m/%Y %H:%M:%S')


# plot the figure
png('plot3.png', width=480, height=480)
plot(time_axis, sub_metering_1, xlab='', ylab='Energy sub metering', type='l')
lines(time_axis, sub_metering_2, col='red', type='l')
lines(time_axis, sub_metering_3, col='blue', type='l')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1,  col=c('black', 'red', 'blue'))
dev.off()
