setwd("C:/Users/P.Chakravarthula/Documents/R_Working/Exploratory_Data_Analysis_Week1_Project")

# Reading, naming and subsetting power consumption data
pow <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(pow) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpow <- subset(pow,power$Date=="1/2/2007" | pow$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpow$Date <- as.Date(subpow$Date, format="%d/%m/%Y")
subpow$Time <- strptime(subpow$Time, format="%H:%M:%S")
subpow[1:1440,"Time"] <- format(subpow[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpow[1441:2880,"Time"] <- format(subpow[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Opening the PNG file
png("Plot4.png", width=480, height=480)
# initiating one graph with multiple rows and columns
par(mfrow=c(2,2))

with(subpow,{
  plot(subpow$Time,as.numeric(as.character(subpow$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpow$Time,as.numeric(as.character(subpow$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpow$Time,subpow$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(subpow,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(subpow,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(subpow,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpow$Time,as.numeric(as.character(subpow$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()