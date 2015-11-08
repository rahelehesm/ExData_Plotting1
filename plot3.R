# Download data, Unzip Data, Read Data and store it in data file

if (!file.exists("data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="data.zip")
  unzip("data.zip")  
}
data <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# choosing a subset of data
data1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
a <- as.numeric(data1$Sub_metering_1)
b <- as.numeric(data1$Sub_metering_2)
c <- as.numeric(data1$Sub_metering_3)
tim <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# png figure and plot 
png(filename = "plot3.png", width = 480 , height = 480)
plot(tim , a , col="black", type = "l" , ylab = "Energy sub metering" , xlab = "")
lines(tim , b ,col="red", type = "l")
lines(tim,c, col = "blue", type = "l")
legend("topright", c("sub_metering_1" , "sub_metering_2" , "sub_metering_3") , lty = 1 , lwd = 2.5 , col = c("black","red", "blue"))
dev.off()