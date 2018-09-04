#!/usr/bin/env Rscript

setwd("C:/Users/P.Chakravarthula/Documents/R_Working/Exploratory_Data_Analysis_Week1_Project")
data_house <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data_house) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_datahouse <- subset(data_house,data_house$Date=="1/2/2007" | data_house$Date =="2/2/2007")

#Opening the PNG file
png("Plot1.png", width=480, height=480)

#calling the plot function
hist(as.numeric(as.character(sub_datahouse$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# Adding the Heading
title(main="Global Active Power")


dev.off()