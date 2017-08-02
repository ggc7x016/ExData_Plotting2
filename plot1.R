NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Q1:Plotting total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')

barplot(height=aggregatedTotalByYear$Emissions, 
	names.arg=aggregatedTotalByYear$year, 
	xlab="years", 
	ylab=expression('total PM'[2.5]*' emission'),
	main=expression('Total PM'[2.5]*' emissions at various years'))

dev.off()