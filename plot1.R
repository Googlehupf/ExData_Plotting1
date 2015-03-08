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


## Plot 1 will be in your active working directory
## ·············································································
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power,
     col = "red",
     breaks = 11,
     ylim = c(0, 1200),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
