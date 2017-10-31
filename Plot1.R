hc <- read.csv.sql("household_power_consumption.txt", 
                      sql = "select * from file where (Date like '1/2/2007')|| (Date like '2/2/2007')", sep=";", eol = "\n")
closeAllConnections()
hist(hc$Global_active_power,col="red",main = "Global Active Power",
     xlab="Global Active Power (kilowatts)", las=1)
dev.copy(png, file="Plot1.png", width =480, height =480)
dev.off()