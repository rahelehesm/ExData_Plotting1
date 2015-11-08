# Download data, Unzip Data, Read Data and store it in data file

if (!file.exists("data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="data.zip")
  unzip("data.zip")  
}
data <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# choosing a subset of data
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
a <- as.numeric(data$Global_active_power) 

#PNG file and hist 
png(filename="plot1.png", width=480, height=480)
hist(a,col = "red", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200), main = "Global Active Power")
dev.off()
