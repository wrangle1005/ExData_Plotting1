# read whole data
library(data.table)
dat = fread('./household_power_consumption.txt', na.strings='?')


# subset required data
sdat = dat[Date == '1/2/2007' | Date == '2/2/2007', ]


# get information
global_active_power = sdat$Global_active_power


# plot the figure
png('plot1.png', width=480, height=480)
hist(yval, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()
