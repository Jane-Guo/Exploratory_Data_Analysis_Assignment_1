#3
Sys.setlocale("LC_TIME", "English")
data <- read.table(pipe('grep "^[1|2]/2/2007\\|Date" "household_power_consumption.txt"'), 
                   sep=";",header=T,na.strings="?")
png("plot3.png",width = 480,height = 480)
par(mfrow=c(1,1))
par(mar=c(4,6,4,4))
with(data,plot(dt,Sub_metering_1,type="n",
               xlab="",ylab="Energy sub metering"))
with(data,lines(dt,Sub_metering_1,col="black"))
with(data,lines(dt,Sub_metering_2,col="red"))
with(data,lines(dt,Sub_metering_3,col="blue"))
legend("topright", lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.75)
dev.off()