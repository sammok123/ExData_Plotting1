hc <- read.csv.sql("household_power_consumption.txt", 
                      sql = "select * from file where (Date like '1/2/2007')|| (Date like '2/2/2007')", sep=";", eol = "\n")
closeAllConnections()
hc$DateTime <- paste(hc$Date, hc$Time, sep=" ")
hc$DateTime = strptime(hc$DateTime, "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
with(hc, {
plot(DateTime, Global_active_power, ylab="Global Active Power", xlab="",type="l")
plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub meeting",
     xlab="", col="black")
lines(DateTime, Sub_metering_2, col="red")
lines(DateTime, Sub_metering_3, col="blue")
})
legend("topright", col=c("black","red","blue"), lty=c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex =0.7, bty="n", y.intersp = 0.2)

plot(hc$DateTime, hc$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime",type="l")
dev.copy(png, file="Plot4.png", width =480, height =480)
dev.off()
par(mfrow=c(1,1))
