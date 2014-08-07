hpc <- read.csv("C:/umutGit/0_Explotary_Data_Analysis/Project1/ExData_Plotting1.git/trunk/household_power_consumption.txt",
                sep=";",
                na.strings="?",
                stringsAsFactors=FALSE,
                header = TRUE)
hpcFiltered <- subset(hpc, hpc$Date %in% c("1/2/2007","2/2/2007"))
# Setting English Locale for the X Axis Values
# Without this Thu, Fri, Sat is not in English :=)
Sys.setlocale("LC_TIME", "C")

hpcFiltered$V10 <- paste(hpcFiltered$Date,hpcFiltered$Time)
hpcFiltered$V10 <- strptime(hpcFiltered$V10, "%d/%m/%Y %H:%M:%S")

png(file="plot4.png",width = 480,height = 480,bg = "transparent",units = 'px',type = "cairo-png")

par(mfrow = c(2,2))
#par(cex=0.6)
#par(oma=c(0,0,0,0))
#par(mar=c(5.1,4.1,4.1,2.1))

plot(hpcFiltered$V10,hpcFiltered$Global_active_power,
     type="l",
     ylab="Global Active Power",
     xlab=""
)

plot(hpcFiltered$V10,hpcFiltered$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime"
)

plot(hpcFiltered$V10,hpcFiltered$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(hpcFiltered$V10,hpcFiltered$Sub_metering_2,type="l",col="red")
lines(hpcFiltered$V10,hpcFiltered$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"),bty="n",cex=0.95)

plot(hpcFiltered$V10,hpcFiltered$Global_reactive_power,
     ylab="Global_reactive_power",
     type="l",
     xlab="datetime"
)

dev.off()