
#3 Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a
#plot answer this question.

# Subsetting data for Maryland

NEIMaryland = subset(NEI,fips == "24510") 
str(NEIMaryland)


#Convert year as factor variable
NEIMaryland$year <- factor(NEIMaryland$year, levels=c('1999', '2002', '2005', '2008'))


# Plotting using ggplot
png("plot3_week4.png", width=480, height=480)
require(ggplot2)
qplot(x=year,y=Emissions, data=NEIMaryland,facets = .~ type, xlab='Year', ylab='Emissions by type')
dev.off()
