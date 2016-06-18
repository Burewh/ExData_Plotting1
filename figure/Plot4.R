# read data from the with dates 
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Convert the date format using the strptime
hpc$Date <- strptime(hpc$Date, format = "%d/%m/%Y")
# extract the required data for expoltary analysis -  from "2007-02-01" to "2007-02-02"
hpcreqdata <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")
# add a variable by merging the date and time called Datetime
hpcreqdatatr<- within(hpcreqdata, { Datetime = format(as.POSIXlt(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") }) 
#create the plot file in working dircetory "Plot1.png"
png(file = "Plot4.png", width = 480, height = 480)
# call the par command to allign the plots  
par(mfrow = c(2,2), mar = c(5,4,4,2))
# call plot command to drow the four plots
plot(hpcreqdatatr$datetiem, hpcreqdatatr$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(hpcreqdatatr$datetiem, hpcreqdatatr$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plotcolors <- c("black", "red", "blue")
plot(hpcreqdatatr$datetiem, xlab = " ", ylab = "Energy sub metering", hpcreqdatatr$Sub_metering_1, type = "l", col = plotcolors[1])
lines(hpcreqdatatr$datetiem, hpcreqdatatr$Sub_metering_2, type = "l", col = plotcolors[2])
lines(hpcreqdatatr$datetiem, hpcreqdatatr$Sub_metering_3, type = "l", col = plotcolors[3])
legend("topright", names(hpcreqdatatr[7:9]),cex = 0.8, col = plotcolors, lty = 1)
plot(hpcreqdatatr$datetiem, hpcreqdatatr$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")
# close the plotting platform and save to "Plot4.png"
dev.off()