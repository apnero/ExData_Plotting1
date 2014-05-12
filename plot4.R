#Read data file
hpc <- read.csv("household_power_consumption.txt", sep=";")

#Convert Dates in data file to Date format                     
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")                    

#get subset of 2 days in feb 1st and 2nd
hpc2days <- subset(hpc, Date %in% c( as.Date('2007-02-01'), as.Date('2007-02-02') ) )

#get the size of the subsets for the ticks on the graph
hpcfirst <- subset(hpc2days, Date %in% as.Date('2007-02-01'))
size <-length(hpcfirst[,1])
hpcsecond <- subset(hpc2days, Date %in% as.Date('2007-02-02'))
size2 <-length(hpcsecond[,1])

#display graph
par(mfrow=c(2,2))
#######################################
#display graph1
    plot(as.numeric(as.character(hpc2days$Global_active_power)), axes=FALSE, type="l", xlab="", ylab="Global Active Power")
    
    #label axes
    axis(2, at=c(0,2,4,6))
    axis(1, at=c(1,size,size+size2), lab=c("Thu","Fri", "Sat"))
    
    #draw box around graph
    box()

#######################################
  #display graph2
  plot(as.numeric(as.character(hpc2days$Voltage)), axes=FALSE, type="l", xlab="datetime", ylab="Voltage")
  axis(2, at=c(234,238,242,246))
  axis(1, at=c(1,size,size+size2), lab=c("Thu","Fri", "Sat"))
  box()

#######################################
  #display graph3
  plot(as.numeric(as.character(hpc2days$Sub_metering_1)), axes=FALSE, type="l", xlab="", ylab="Energy sub metering")

  #label axes
  axis(2, at=c(0,10,20,30))
  axis(1, at=c(1,size,size+size2), lab=c("Thu","Fri", "Sat"))

#add other lines on graph
lines(as.numeric(as.character(hpc2days$Sub_metering_2)), col="red")
lines(as.numeric(as.character(hpc2days$Sub_metering_3)), col="blue")    

#draw box around graph
box()

#add legend
legend("topright", c(names(hpc2days[7]),names(hpc2days[8]),names(hpc2days[9])), cex=0.6, col=c("black", "red", "blue"), bty="n", lty=1, lwd=2)

#######################################
#display graph4
  plot(as.numeric(as.character(hpc2days$Global_reactive_power)), axes=FALSE, type="l", xlab="datetime", ylab="Global_reactive_power")
  axis(2, at=c(0.0,0.1,0.2,0.3, 0.4, 0.5))
  axis(1, at=c(1,size,size+size2), lab=c("Thu","Fri", "Sat"))
  box()