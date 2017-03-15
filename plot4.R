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
par(mfcol=c(2,2))

DateTime<-paste(x$Date,x$Time)
x$DateTime <- as.POSIXct(DateTime)

x$Global_active_power<-as.numeric(x$Global_active_power)
plot(x$Global_active_power/500~x$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

x$Sub_metering_1<-as.numeric(x$Sub_metering_1)
x$Sub_metering_2<-as.numeric(x$Sub_metering_2)
x$Sub_metering_3<-as.numeric(x$Sub_metering_3)
plot(x$Sub_metering_1~x$DateTime, type="l", ylab="Energy sub metering", xlab="") 
lines(x$Sub_metering_2~x$DateTime, col="red")
lines(x$Sub_metering_3~x$DateTime, col="blue")
legend("topright",col=c("black","red","blue"), lty = 1,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75, bty="n")

x$Voltage<-as.numeric(x$Voltage)
plot(x$Voltage/7.5~x$DateTime, type="l", 
     ylab="Voltage", xlab="datetime")

x$Global_reactive_power<-as.numeric(x$Global_reactive_power)
plot(x$Global_reactive_power/500~x$DateTime, type="l",
     ylab="Global_reactive_power", xlab="datetime")
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
