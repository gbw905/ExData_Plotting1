plot3 <- function(){
  myData <- read.csv2("./exdata-data-household_power_consumption/household_power_consumption.txt", dec=".")
  myData <- transform(myData, 
       Time = strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
       Date = as.Date(Date, format="%d/%m/%Y"))
  myData <- myData[(myData$Date == as.Date(as.character('2007-02-01')) | 
       myData$Date == as.Date(as.character('2007-02-02'))),]
  myData <- transform(myData, 
       Global_active_power = as.numeric(as.character(Global_active_power)), 
       Global_reactive_power = as.numeric(as.character(Global_reactive_power)), 
       Voltage = as.numeric(as.character(Voltage)), 
       Global_intensity = as.numeric(as.character(Global_intensity)), 
       Sub_metering_1 = as.numeric(as.character(Sub_metering_1)), 
       Sub_metering_2 = as.numeric(as.character(Sub_metering_2)), 
       Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
  
  png(filename="plot3.png")
  plot(myData$Time, 
       myData$Sub_metering_1, 
       type="l", 
       ylim=c(0, 40),
       xlab="", 
       ylab="Energy sub metering")
  par(new=T)
  plot(myData$Time, 
       myData$Sub_metering_2, 
       type="l", 
       col="red", 
       ylim=c(0, 40),
       xlab="", 
       ylab="")
  par(new=T)
  plot(myData$Time, 
       myData$Sub_metering_3, 
       type="l", 
       col="blue", 
       ylim=c(0, 40),
       xlab="", 
       ylab="")
  legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       col=c("black", "red", "blue"))
  dev.off()
  
  return(myData)
}
