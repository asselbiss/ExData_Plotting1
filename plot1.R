data <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                       "household_power_consumption.txt"), sep = ";", header = TRUE )
dim(data)
head(data)
colnames(data)
class(data$Date)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
x<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
head(x)
dim(x)
x$Global_active_power<-as.numeric(x$Global_active_power)
hist(x$Global_active_power/500, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
