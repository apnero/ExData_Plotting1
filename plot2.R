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
plot(as.numeric(as.character(hpc2days$Global_active_power)), axes=FALSE, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#label axes
axis(2, at=c(0,2,4,6))
axis(1, at=c(1,size,size+size2), lab=c("Thu","Fri", "Sat"))

#draw box around graph
box()

