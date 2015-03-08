# read the data frame - note the values are ; separated
df <- read.table(file = "household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 strip.white = TRUE, 
                 stringsAsFactors = FALSE)

df <- subset(df, as.Date(df$Date, format='%d/%m/%Y') >= as.Date('2007-02-01', format = "%Y-%m-%d"))
df <- subset(df, as.Date(df$Date, format='%d/%m/%Y') <= as.Date('2007-02-02', format = "%Y-%m-%d"))

# extract a numeric vector of the Global Active Power
globalActivePower <- as.numeric(df$Global_active_power)

# initialize png graphics output device
png(filename = "plot1.png", 
    width = 480, 
    height = 480, 
    units = "px", 
    bg = "white")

# plot the histogram
hist(globalActivePower, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")

# turn off graphics output device
dev.off()
