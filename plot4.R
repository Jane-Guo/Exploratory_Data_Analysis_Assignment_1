#4
data <- read.table(pipe('grep "^[1|2]/2/2007\\|Date" "household_power_consumption.txt"'), 
                   sep=";",header=T,na.strings="?")
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2),mar=c(4,4,4,4),oma=c(2,2,2,0))
dt<-paste(data$Date,data$Time)
dt<-strptime(dt,"%d/%m/%Y %H:%M:%S")
#data$Date=as.Date(data$Date, "%d/%m/%Y")
plot(dt,data$Global_active_power,type="n",xlab="",
     ylab="Global Active Power (kilowatts)")
lines(x=dt,y=data$Global_active_power,type="l")

plot(dt,data$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(x=dt,y=data$Voltage,type="l")

with(data,plot(dt,Sub_metering_1,type="n",
               xlab="",ylab="Energy sub metering"))
with(data,lines(dt,Sub_metering_1,col="black"))
with(data,lines(dt,Sub_metering_2,col="red"))
with(data,lines(dt,Sub_metering_3,col="blue"))
legend("topright", lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.75,bty="n")


plot(dt,data$Global_reactive_power,type="n",xlab="datetime",ylab="Global reactive power")
lines(x=dt,y=data$Global_reactive_power,type="l")

dev.off()
