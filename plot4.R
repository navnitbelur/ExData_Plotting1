# read the data frame - note the values are ; separated
df <- read.table(file = "household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 strip.white = TRUE, 
                 stringsAsFactors = FALSE)

df <- subset(df, as.Date(df$Date, format='%d/%m/%Y') >= as.Date('2007-02-01', format = "%Y-%m-%d"))
df <- subset(df, as.Date(df$Date, format='%d/%m/%Y') <= as.Date('2007-02-02', format = "%Y-%m-%d"))


# initialize png graphics output device
png(filename = "plot4.png", 
    width = 480, 
    height = 480, 
    units = "px", 
    bg = "white")

par(mfrow = c(2,2))

# plot 1 = histogram of global active power
globalActivePower <- as.numeric(df$Global_active_power)
plot(globalActivePower, 
     type = "l", 
     ylab = "Global Active Power",
     xlab = "",
)

# plot 2 = voltage graph
voltage <- as.numeric(df$Voltage)
plot(voltage,
     type = "l", 
     ylab = "Voltage", 
     xlab = "datetime"
     )

# plot 3 = the graph of submeterings

# extract a numeric vector of the sub meterings
subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2)
subMetering3 <- as.numeric(df$Sub_metering_3)

plot(subMetering1,
     type = "l", 
     ylab = "Energy sub metering",
     xlab = "",
     col = "black"
)

points(subMetering2, 
       type = "l",
       col = "red")

points(subMetering3, 
       type = "l",
       col = "blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1),
       col = c("black", "red", "blue"))


# plot 4 = global reactive power
globalReactivePower <- as.numeric(df$Global_reactive_power)
plot(globalReactivePower,
     type = "l", 
     ylab = "Global_reactive_power", 
     xlab = "datetime"
)

# turn off graphics output device
dev.off()