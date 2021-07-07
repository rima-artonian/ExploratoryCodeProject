#Second Histogram for the power consumption - plot 2

electrical <-  read.table("~/Downloads/HPC.txt", skip=1, sep=";")
names(electrical) <- c("Date", "Time","Global_active_power", "Global_reactive_power",
                       "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                       "Sub_metering_3")

head(electrical)


EDates <- subset(electrical, electrical$Date== "1/2/2007" | electrical$Date == "2/2/2007")

EDates$Date <- as.Date(EDates$Date, format="%d/%m/%Y")
EDates$Time <- strptime(EDates$Time, format="%H: %M : %S")
EDates[1:1440, "Time"] <- format(EDates[1:1440, "Time"], "2007-02-01 %H: %M: %S")
EDates[1441:2880, "Time"] <- format(EDates[1441:2880, "Time"], "2007-02-02 %H: %M: %S")

plot(EDates$Time, EDates$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(EDates, lines(Time,as.numeric(as.character(Sub_metering_1))))
with(EDates,  lines(Time,as.numeric(as.character(Sub_metering_2)) ,col="red" ))
with(EDates,  lines(Time,as.numeric(as.character(Sub_metering_3)) ,col="blue" ))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend= c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))




title(main="Energy sub-metering")

