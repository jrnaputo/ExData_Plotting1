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
# Setting the data type of date as date
PowerConsumption$Date <- as.Date(PowerConsumption$Date, format = "%d/%m/%Y")
# Subsetting the dataset from February 1, 2007 to February 2, 2007
Subset_PowerConsumption <- subset(PowerConsumption, Date == "2007-02-01" | Date == "2007-02-02", 
                                  select = Date:Sub_metering_3)

# Plot 2
# Setting the data type of date and time
day <- strptime(paste(Subset_PowerConsumption$Date, Subset_PowerConsumption$Time, sep=" "), 
                format = "%Y-%m-%d %H:%M:%S")
# Setting the data type of global_active_power as numeric
GlobalActivePower <- as.numeric(Subset_PowerConsumption$Global_active_power)
# Setting the graphic device as PNG format with a width and a height of 480 pixels each
png(filename = "Plot2.png", width = 480, height = 480)
# Plotting the Global Active Power as a function of day
plot(day,GlobalActivePower, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")
# Closing the specified graphic device
dev.off()
