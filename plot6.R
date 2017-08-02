NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Q6: Compare emissions from motor vehicle sources in 
# Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). Which 
# city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

# Getting Baltimore & LA data for motor vehicles only
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)

#Renaming fips entries to more readable name of the city
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles"

png("plot6.png")

g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))

#
#g <- g + facet_grid(. ~ fips)

g <- 	g + 
	geom_bar(stat="identity")  +
	xlab("year") +
	ylab(expression('Total PM'[2.5]*" Emissions")) +
	ggtitle('Motor Vehicle Emissions, Baltimore vs Los Angeles (1999-2008)')

print(g)

dev.off()

