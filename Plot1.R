electrical <-  read.table("~/Downloads/HPC.txt", skip=1, sep=";")
names(electrical) <- c("Date", "Time","Global_active_power", "Global_reactive_power",
                       "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                       "Sub_metering_3")

head(electrical)
#First Histogram for the power consumption - plot 1

EDates <- subset(electrical, electrical$Date== "1/2/2007" | electrical$Date == "2/2/2007")
hist(as.numeric(as.character(EDates$Global_active_power)), 
                  col="red", main="Global Active Power",
                  xlab ="Global Active Power (kilowatts)")











