## COURSERA EXPLORATORY DATA ANALYSIS (2015)
## COURSE PROJECT 1

## submitted by: Googlehupf

## ·············································································
## Prerequisite:
## SOURCE FILE IS ASSUMED TO BE IN YOUR ACTIVE WORKING DIRECTORY
## ·············································································

rm(list = ls())
graphics.off()   ## clean up any old stuff

## reading the data
## NOTE. Data file was inspected beforehand. Reading in rows where 'Date' is "1/2/2207" or "2/2/2207". All other rows omitted to economise on working memory.
data <- read.table("household_power_consumption.txt", header = TRUE, skip = 66636, nrow = 2880, sep = ";", fileEncoding = "UTF-8", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
## Skipping lines in read.table() messes with the header.
## Resetting the variable names:
header <- read.table("household_power_consumption.txt", header = FALSE, nrow = 1, sep = ";", stringsAsFactors = FALSE)
colnames(data) <- unlist(header)

rm(header)  ## clean up
## in case you want to double-check:
nrow(data)          ## 2880 obs.
unique(data$Date)   ## the desired two dates


## Plot 4 will be in your active working directory
## ·············································································
## Setting time locale to English for weekday abbreviations
## original locale will be restored after the plot
locale <- Sys.getlocale(category = "LC_TIME")
Sys.setlocale(category = "LC_TIME", "en_GB.UTF-8")

## Combine Date and Time to proper format
data$DateTime = strptime((paste(data$Date, data$Time)), format = "%d/%m/%Y %H:%M:%S")
## Build and save the plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, plot(DateTime, Global_active_power,
                type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))
with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime"))
with(data, plot(DateTime, Sub_metering_1,
                type = "l",
                ylab = "Energy sub metering", xlab = "",
                ylim = c(0, max(Sub_metering_1, Sub_metering_2, Sub_metering_3))))
with(data, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(data, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")
with(data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()
par(mfrow = c(1, 1))  ## reset par()

## Back to the original time locale
Sys.setlocale(category = "LC_TIME", locale)
rm(locale)
