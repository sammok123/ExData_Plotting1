hc <- read.csv.sql("household_power_consumption.txt", 
                      sql = "select * from file where (Date like '1/2/2007')|| (Date like '2/2/2007')", sep=";", eol = "\n")
closeAllConnections()
hc$DateTime <- paste(hc$Date, hc$Time, sep=" ")
hc$DateTime = strptime(hc$DateTime, "%d/%m/%Y %H:%M:%S")
plot(hc$DateTime,hc$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file="Plot2.png", width =480, height =480)
dev.off()