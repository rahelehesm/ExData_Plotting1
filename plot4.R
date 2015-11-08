# check the existence of data 

if (!file.exists("data.zip")){
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
  unzip("data.zip")
}
data <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# choosing subset of data corresponding to Date equal 1/2/2007 or 2/2/2007
data1 <- subset(data, Date== "1/2/2007" | Date=="2/2/2007")
a <- as.numeric(data1$Sub_metering_1)
b <- as.numeric(data1$Sub_metering_2)
c <- as.numeric(data1$Sub_metering_3)

pow <- as.numeric(data1$Global_active_power)
reactpow <- as.numeric(data1$Global_reactive_power)
vol <- as.numeric(data1$Voltage)

tim <- strptime(paste(data1$Date, data1$Time, sep =" "),format = "%d/%m/%Y %H:%M:%S")
 
# save plot as a png file
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# Plotting figures
with(data1,{
  plot(tim,pow, xlab = "", ylab = "Global Active Power", type = "l", col = "black")
  plot(tim,vol, xlab = "datetime", ylab = "voltage", type = "l", col = "black")
  plot(tim,a, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
  lines(tim,b, type = "l", col = "red")
  lines(tim,c, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  plot(tim,reactpow, xlab = "datetime", ylab = "Global_reactive_power", type = "l", col = "black")
})
dev.off()