
NEI <- readRDS('C:/Users/tseadmin/Documents/Swastika/summarySCC_PM25.rds')
SCC <- readRDS('C:/Users/tseadmin/Documents/Swastika/Source_Classification_Code.rds')

# Checking structure of the tables

str(NEI)
str(SCC)

# Adding emissions by year
Emissions_summary = aggregate(NEI$Emissions, by=list(Year=NEI$year), FUN=sum)
str(Emissions_summary)

# Plot - has emissions increased over the years

png("plot1_week4.png", width=480, height=480)
plot(Emissions_summary$x~Emissions_summary$Year, ylab="Emissions", xlab="Year")
dev.off()

