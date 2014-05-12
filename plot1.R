
#Read data file
hpc <- read.csv("household_power_consumption.txt", sep=";")

#Convert Dates in data file to Date format                     
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")                    
 
#get subset of 2 days in feb 1st and 2nd
hpc2days <- subset(hpc, Date %in% c( as.Date('2007-02-01'), as.Date('2007-02-02') ) )

#display histogram
hist(as.numeric(as.character(hpc2days$Global_active_power)), col="red", breaks = c(.5*0:15),      main="Global Active Power", xlab="Global Active Power (kilowatts)" )

