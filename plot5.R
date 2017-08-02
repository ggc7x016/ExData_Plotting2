NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Q5: Plotting motor vehicle emissions in Baltimore

library(ggplot2)

subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("plot5.png")

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))

g <- 	g + 
	geom_bar(stat="identity") +
	xlab("year") +
	ylab(expression('Total PM'[2.5]*" Emissions")) +
	ggtitle('Emissions from motor vehicles in Baltimore City (1999-2008)')

print(g)

dev.off()




