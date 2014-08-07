hpc <- read.csv("C:/umutGit/0_Explotary_Data_Analysis/Project1/ExData_Plotting1.git/trunk/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE,header = TRUE)
hpcFiltered <- subset(hpc, hpc$Date %in% c("1/2/2007","2/2/2007"))
# Setting English Locale for the X Axis Values
# Without this Thu, Fri, Sat is not in English :=)
Sys.setlocale("LC_TIME", "C")

hpcFiltered$V10 <- paste(hpcFiltered$Date,hpcFiltered$Time)
hpcFiltered$V10 <- strptime(hpcFiltered$V10, "%d/%m/%Y %H:%M:%S")

png(file="plot3.png",width = 480,height = 480,bg = "transparent",units = 'px',type = "cairo-png")

plot(hpcFiltered$V10,hpcFiltered$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(hpcFiltered$V10,hpcFiltered$Sub_metering_2,type="l",col="red")
lines(hpcFiltered$V10,hpcFiltered$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5), col=c("black","red","blue"))

dev.off()