## plot2.R

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists(".household_power_consumption.zip")) download.file(fileUrl, destfile=".household_power_consumption.zip")
if (file.exists(".household_power_consumption.zip")) unzip(".household_power_consumption.zip", junkpaths=TRUE, exdir=".", unzip="internal")

householdPowerConsumption <- read.csv("household_power_consumption.txt", sep=";", header=FALSE, skip=66637, nrows=2881)
colnames(householdPowerConsumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, format="%d/%m/%Y")
householdPowerConsumption$Time <- strptime(householdPowerConsumption$Time, "%H:%M:%S")
householdPowerConsumption$Time <- strftime(householdPowerConsumption$Time, '%H:%M:%S')
householdPowerConsumption$DateTime <- as.POSIXct(paste(householdPowerConsumption$Date, householdPowerConsumption$Time))

png("plot2.png", width=480, height=480)
plot(householdPowerConsumption$DateTime, householdPowerConsumption$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
