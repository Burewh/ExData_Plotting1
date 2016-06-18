# read data from the with dates 
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Convert the date format using the strptime
hpc$Date <- strptime(hpc$Date, format = "%d/%m/%Y")
# extract the required data for expoltary analysis -  from "2007-02-01" to "2007-02-02"
hpcreqdata <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")
# add a variable by merging the date and time called Datetime
hpcreqdatatr<- within(hpcreqdata, { Datetime = format(as.POSIXlt(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") }) 
#create the plot file in working dircetory "Plot1.png"
png(file = "Plot1.png", width = 480, height = 480)
# call the hist command to generate histogram for global active power 
hist(hpcreqdatatr$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
# close the plotting platform and save to "Plot1.png"
dev.off()