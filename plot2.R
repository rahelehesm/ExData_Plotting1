# Download data, Unzip Data, Read Data and store it in data file

if (!file.exists("data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="data.zip")
  unzip("data.zip")  
}
data <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# choosing a subset of data
data1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
a <- as.numeric(data1$Global_active_power) 
tim <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# png file and plot
png(filename = "plot2.png", width = 480, height = 480)
plot(tim,a,type = "l" ,xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
