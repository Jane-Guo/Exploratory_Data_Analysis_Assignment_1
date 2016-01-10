#2
Sys.setlocale("LC_TIME", "English")
data <- read.table(pipe('grep "^[1|2]/2/2007\\|Date" "household_power_consumption.txt"'), 
                   sep=";",header=T,na.strings="?")
png("plot2.png",width = 480,height = 480)
par(mfrow=c(1,1))
par(mar=c(4,6,4,4))
dt<-paste(data$Date,data$Time)
dt<-strptime(dt,"%d/%m/%Y %H:%M:%S")
#data$Date=as.Date(data$Date, "%d/%m/%Y")
plot(dt,data$Global_active_power,type="n",xlab="",
     ylab="Global Active Power (kilowatts)")
lines(x=dt,y=data$Global_active_power,type="l")
dev.off()
