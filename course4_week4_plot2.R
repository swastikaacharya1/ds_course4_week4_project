
# Subsetting data for Maryland

NEIMaryland = subset(NEI,fips == "24510") 
str(NEIMaryland)

##Adding emissions by year
Emissions_summary_Maryland = aggregate(NEIMaryland$Emissions, by=list(Year=NEIMaryland$year), FUN=sum)
str(Emissions_summary_Maryland)

# Plot - has emissions increased over the years for Baltimore City - Maryland

png("plot2_week4.png", width=480, height=480)
plot(Emissions_summary_Maryland$x~Emissions_summary_Maryland$Year, ylab="Emissions in Maryland", xlab="Year")
dev.off()

