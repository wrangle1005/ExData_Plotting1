# read whole data
dat = fread('./household_power_consumption.txt', na.strings='?')


# subset required data
sdat = dat[Date == '1/2/2007' | Date == '2/2/2007', ]


# get information
global_active_power = sdat$Global_active_power
time_axis = strptime(paste(sdat$Date, sdat$Time, sep=' '), '%d/%m/%Y %H:%M:%S')


# plot the figure
png('plot2.png', width=480, height=480)
plot(time_axis, global_active_power, xlab='', ylab='Global Active Power (kilowatts)', type='l')
dev.off()
