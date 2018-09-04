# Reading the data
data_housecon<- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data_housecon) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_datahouse <- subset(data_housecon,data_housecon$Date=="1/2/2007" | data_housecon$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
sub_datahouse$Date <- as.Date(sub_datahouse$Date, format="%d/%m/%Y")
sub_datahouse$Time <- strptime(sub_datahouse$Time, format="%H:%M:%S")
sub_datahouse[1:1440,"Time"] <- format(sub_datahouse[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_datahouse[1441:2880,"Time"] <- format(sub_datahouse[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Opening the PNG file
png("Plot2.png", width=480, height=480)

# Plotting the Graph
plot(sub_datahouse$Time,as.numeric(as.character(sub_datahouse$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# Adding the Title
title(main="Global Active Power Vs Time")

dev.off()

