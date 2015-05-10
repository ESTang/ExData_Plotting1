#--------------------------------------------------
# Program: Plot2.R
# Description: Creates the 2nd plot for the 
# Course Project 1
# Work directory must be set properly to include the 
# household_power_consumption.txt file 
#--------------------------------------------------

# Changing default work directory
setwd("D:\\R\\Training\\Exploratory Data Analysis - Coursera\\Project_1\\exdata-data-household_power_consumption")


# Loading Household_Power_Consumption data
Elec_consumption <- read.table("household_power_consumption.txt",
                               sep=";",
                               stringsAsFactors = F,
                               header = T)

Elec_consumption_conv <- Elec_consumption


# Converting Character variable from character to numeric 
Elec_consumption_conv$Date_Time <- strptime(paste(Elec_consumption_conv$Date,Elec_consumption_conv$Time),"%d/%m/%Y %H:%M:%S")
Elec_consumption_conv$Date <- as.Date(Elec_consumption_conv$Date,
                                      format = "%d/%m/%Y") 
Elec_consumption_conv$Global_active_power <- as.numeric(Elec_consumption_conv$Global_active_power)
Elec_consumption_conv$Global_reactive_power <- as.numeric(Elec_consumption_conv$Global_reactive_power)
Elec_consumption_conv$Voltage <- as.numeric(Elec_consumption_conv$Voltage)
Elec_consumption_conv$Global_intensity <- as.numeric(Elec_consumption_conv$Global_intensity)
Elec_consumption_conv$Sub_metering_1 <- as.numeric(Elec_consumption_conv$Sub_metering_1)
Elec_consumption_conv$Sub_metering_2 <- as.numeric(Elec_consumption_conv$Sub_metering_2)

# Subset to needed data
Elec_consumption_sub <- subset(Elec_consumption_conv,
                               Elec_consumption_conv$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))


# Producing exploratory plots

# Reducing font size
par(cex = 0.7)

# Plot 2
png(file = "plot2.png",width = 480, height = 480)
plot(Elec_consumption_sub$Global_active_power, 
     type = "l",
     xaxt = "n",
     ylab = "Global Active Power (kilowatts)",
     xlab = "" )
axis(side = 1, at = c(1,1441,2880), label = c("Thu","Fri","Sat"))

 
#closing device
dev.off()


# End of program
