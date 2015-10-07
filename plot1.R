
print("Read file ...")
all_data <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

print("Convert Date to Date ...")
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
ds <- all_data[all_data$Date >= as.Date("2007-02-01") & all_data$Date <= as.Date("2007-02-02"),]

print("Convert time to POSIXct ...")
ds$Time <- as.POSIXct(paste(ds$Date,temp, sep=""), tz="")

print("Print histogram ...")

par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))
with(ds, hist(Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", main = "Global Active Power"))
print("Copy graph to PNG")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()    

print("Done ...")