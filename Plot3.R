hc <- read.csv.sql("household_power_consumption.txt", 
                      sql = "select * from file where (Date like '1/2/2007')|| (Date like '2/2/2007')", sep=";", eol = "\n")
closeAllConnections()
hc$DateTime <- paste(hc$Date, hc$Time, sep=" ")
hc$DateTime = strptime(hc$DateTime, "%d/%m/%Y %H:%M:%S")
with(hc, {
plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering",
     xlab="", col="black")
lines(DateTime, Sub_metering_2, col="red")
lines(DateTime, Sub_metering_3, col="blue")
})
legend("topright", col=c("black","red","blue"), lty=c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="Plot3.png", width =480, height =480)
dev.off()