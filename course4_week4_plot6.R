##
##6 Compare emissions from motor vehicle sources in Baltimore City with emissions from 
#motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS('C:/Users/tseadmin/Documents/Swastika/summarySCC_PM25.rds')
SCC <- readRDS('C:/Users/tseadmin/Documents/Swastika/Source_Classification_Code.rds')


#Subsetting Data for Maryland and California

NEIbltMotor = subset(NEI,fips =="24510" & type =="ON-ROAD")
NEIclfMotor = subset(NEI,fips =="06037" & type =="ON-ROAD")
     
#Aggregating for California and Baltimore City
                   
NEIbltMotoragg <- aggregate(NEIbltMotor[, 'Emissions'], by=list(NEIbltMotor$year), sum)
NEIbltMotoragg$City = 'Baltimore'
str(NEIbltMotoragg)

NEIclfMotoragg <- aggregate(NEIclfMotor[, 'Emissions'], by=list(NEIclfMotor$year), sum)
NEIclfMotoragg$City = 'Los Angeles County'
str(NEIclfMotoragg)

NEIbltclfMotor = rbind(NEIbltMotoragg,NEIclfMotoragg)
str(NEIbltclfMotor)

# Plot - has emissions increased over the years for Coal Combustion source
require(ggplot2)

png("plot6_week4.png", width=480, height=480)

qplot(Group.1,x, data=NEIbltclfMotor, facets=.~ City, size=I(3),
      xlab="Year", ylab="Emissions",main="Comparison for Motor Vehicle emissions in Los Angeles County vs. Baltimore City") 

dev.off()