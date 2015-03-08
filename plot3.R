# read the data frame - note the values are ; separated
df <- read.table(file = "household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 strip.white = TRUE, 
                 stringsAsFactors = FALSE)

df <- subset(df, as.Date(df$Date, format='%d/%m/%Y') >= as.Date('2007-02-01', format = "%Y-%m-%d"))
df <- subset(df, as.Date(df$Date, format='%d/%m/%Y') <= as.Date('2007-02-02', format = "%Y-%m-%d"))

# extract a numeric vector of the sub meterings
subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2)
subMetering3 <- as.numeric(df$Sub_metering_3)

# initialize png graphics output device
png(filename = "plot3.png", 
    width = 480, 
    height = 480, 
    units = "px", 
    bg = "white")

# plot the graph
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


# turn off graphics output device
dev.off()