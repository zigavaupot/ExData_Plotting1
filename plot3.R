
print("Read file ...")
all_data <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

print("Convert Date to Date ...")
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
ds <- all_data[all_data$Date >= as.Date("2007-02-01") & all_data$Date <= as.Date("2007-02-02"),]

print("Convert time to POSIXct ...")
ds$Time <- as.POSIXct(paste(ds$Date,temp, sep=""), tz="")

print("Print plot ...")

par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))
with(ds, { plot(Sub_metering_1 ~ Time, type = "l", xlab="", ylab="Energy Sub Metering")
lines(Sub_metering_2 ~ Time, col="red")
lines(Sub_metering_3 ~ Time, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

print("Copy graph to PNG")
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()    

print("Done ...")