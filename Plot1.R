## Plot 1

## Welcome to my assignement for week 1 of the Exploratory Analysis course!
## Before doing any plot, I imported the dataset in a table called hpc thanks to the readr package.
library(readr)
hpc <- read_delim("household_power_consumption.txt", 
+     ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
       +         Sub_metering_1 = col_double(), Sub_metering_2 = col_double(), 
       +         Time = col_time(format = "%H:%M:%S")), 
+     na = "?", trim_ws = TRUE)

## Thanks to this code the NAs are managed, and all my columns directly have the type I want them to have.
## Then I subsetted the two days we want to work on:
data<-subset(hpc, Date == "2007-02-01" | Date == "2007-02-02" )
## For the plots 2, 3 and 4 we will need a new column, I use the tidyverse package to create a new column where I paste Date and Time
library(tidyverse)
data<-mutate(data, timestr = paste(Date, Time))
## Then I make sure that this new column is of the POSIXct class
data[,10]<-as.POSIXct(data$timestr)

## We can plot now.
## Plot construction and export as a png file:

png("Plot 1.png")
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()

## The size of the pictures is correct by default.