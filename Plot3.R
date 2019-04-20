# This is a course project for the Week 1 of Exploratory Data Analysis 

# Downloading the file from the web
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip")
# Unzipping the file
unzip("./data/household_power_consumption.zip", exdir = "./data")
# Reading the household power consumption text file
PowerConsumption <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";",
                               stringsAsFactors = FALSE)
# Setting the data type of date to date
PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y")
# Subsetting the dataset from February 1, 2007 to February 2, 2007
Subset_PowerConsumption <- subset(PowerConsumption, Date == "2007-02-01" | Date == "2007-02-02", 
                                  select = Date:Sub_metering_3)

# Plot 3
# Setting the data type of both date and time
day <- strptime(paste(Subset_PowerConsumption$Date, Subset_PowerConsumption$Time, sep=" "), 
                format = "%Y-%m-%d %H:%M:%S")
# Setting the data type of Sub_metering_1 up to Sub_metering_3 as numeric
Subset_PowerConsumption[,7:9] <- lapply(Subset_PowerConsumption[,7:9], FUN = as.numeric)
# Setting the graphic device as PNG format with a width and a height of 480 pixels each
png(filename = "Plot3.png", width = 480, height = 480)
# Plotting the Sub_metering_1 as a function of day
plot(day,Subset_PowerConsumption$Sub_metering_1, type = "l", col = "black", xlab = "", 
     ylab = "Energy sub metering")
# Plotting the Sub_metering_2 as a function of day on the existing plot
lines(day,Subset_PowerConsumption$Sub_metering_2, type = "l", col = "red")
# Plotting the Sub_metering_2 as a function of day on the existing plot
lines(day,Subset_PowerConsumption$Sub_metering_3, type = "l", col = "blue")
# Placing a legend on each corresponding plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, 
       col = c("black", "red", "blue"))
# Closing the specified graphic device
dev.off()
