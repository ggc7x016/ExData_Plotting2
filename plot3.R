NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Q3: Plotting PM2.5 emissions in Baltimore City by source type (point, nonpoint, onroad, nonroad)

library(ggplot2)
subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png("plot3.png")

g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))

g <- 	g + 
	geom_line() + 
	xlab("year") +
	ylab(expression('Total PM'[2.5]*" Emissions")) +
	ggtitle('Emissions in Baltimore City, Maryland from 1999 to 2008')

print(g)

dev.off()