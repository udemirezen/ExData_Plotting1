hpc <- read.csv("C:/umutGit/0_Explotary_Data_Analysis/Project1/ExData_Plotting1.git/trunk/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE,header = TRUE)
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
hpc$Time <- strptime(hpc$Time,"%H:%M:%S")

startDate = as.Date("2007-02-01")
endDate = as.Date("2007-02-02")
hpcFiltered <- subset(hpc, hpc$Date >= startDate & hpc$Date <= endDate)

png(file="plot1.png",width = 480,height = 480,bg = "transparent",units = 'px',type = "cairo-png")
htgm <- hist(hpcFiltered$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
     )
dev.off()