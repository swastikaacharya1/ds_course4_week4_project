##4 Across the United States, 
##how have emissions from coal combustion-related sources changed from 1999-2008?

NEI <- readRDS('C:/Users/tseadmin/Documents/Swastika/summarySCC_PM25.rds')
SCC <- readRDS('C:/Users/tseadmin/Documents/Swastika/Source_Classification_Code.rds')


# Using text based search string for searching for Coal related combustion sources
SCCCoal = SCC[grep("Coal",SCC$Short.Name ,fixed = TRUE),]

# Merging Datasets to get details about coal based sources

NEISourcecoal = merge (NEI,SCCCoal,by='SCC')
str(NEISourcecoal)

#Aggregating Data for Emissions

NEISourcecoalagg = aggregate(NEISourcecoal$Emissions, by=list(Year=NEISourcecoal$year), FUN=sum)
str(NEISourcecoalagg)

# Plot - has emissions increased over the years for Coal Combustion source

png("plot4_week4.png", width=480, height=480)
plot(NEISourcecoalagg$x~NEISourcecoalagg$Year, ylab="Emissions from Coal", xlab="Year")
dev.off()


