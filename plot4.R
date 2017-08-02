NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Q4: Plotting Coal emissions from 1999-2008 across US

library(ggplot2)

# Find the coal related entries and create a subset specifically for coal
coal  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
subsetSCC    <- SCC[coal, ]

subsetNEISCC <- merge(NEI, subsetSCC, by="SCC")

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png("plot4.png", width=640, height=480)

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))

g <- 	g + 
	geom_bar(stat="identity") +
	xlab("year") +
	ylab(expression('Total PM'[2.5]*" Emissions")) +
	ggtitle('Emissions from coal sources in US (1999-2008)')

print(g)
dev.off()