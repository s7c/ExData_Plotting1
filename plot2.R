# This assignment uses data from the UC Irvine Machine Learning Repository
#after I dowloaded and unzipped the file, this follows:
library(dplyr)
data <- read.table('./household_power_consumption.txt',  header = TRUE, sep = ";", na.strings = '?', stringsAsFactors = FALSE)#The dataset has 2,075,259 rows and 9 columns
#We will only be using data from the dates 2007-02-01 and 2007-02-02. For that I'm using filter() from dplyr package.
#I tried to read directly the data from just those dates using fread() from data.table package,
#in combination with grep(). But this approach in windows is very hard to achieve so I gave up.
data <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")
#I convert the Date and Time variables to Date/Time classes in R 
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
# And now I get rid of Date & Time columns...
data$Time <- NULL
data$Date <- NULL
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels..
#Innitially I used dev.copy(png, file = 'plot1.png', width=480, height=480) but found some distorsions.
png(file = 'plot2.png', width=480, height=480, bg = 'transparent')
plot(data$DateTime, data$Global_active_power, type="l", xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()

#graphics viewers don't show transparency consistently,  it's still not clarified in project requirements
#Try to reproduce the graphics as closely as possible as the graphics on the web page (project page) where it's not 
#evident that the plots are with transparent background if you don't save the image.
