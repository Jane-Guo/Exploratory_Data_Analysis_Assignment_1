#1
data <- read.table(pipe('grep "^[1|2]/2/2007\\|Date" "household_power_consumption.txt"'), 
                   sep=";",header=T,na.strings="?")
png("plot1.png",width = 480,height = 480)
par(mfrow=c(1,1))
par(mar=c(6,6,4,4))
hist(data$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()