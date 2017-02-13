##
##5 How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

NEI <- readRDS('C:/Users/tseadmin/Documents/Swastika/summarySCC_PM25.rds')
SCC <- readRDS('C:/Users/tseadmin/Documents/Swastika/Source_Classification_Code.rds')

# Subsetting Data for Maryland 

NEIMarylandMotor = subset(NEI,fips =="24510" & type =="ON-ROAD") 
str(NEIMarylandMotor)


#Aggregating Data for Emissions

NEISourceMotorvltagg = aggregate(NEIMarylandMotor$Emissions, by=list(Year=NEIMarylandMotor$year), FUN=sum)
str(NEISourceMotorvltagg)

# Plot - has emissions increased over the years for Coal Combustion source

png("plot5_week5.png", width=480, height=480)
plot(NEISourceMotorvltagg$x~NEISourceMotorvltagg$Year, ylab="Emissions from Motor Vehiclein Maryland", xlab="Year")
dev.off()



