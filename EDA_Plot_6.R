## Exploratory Data Analysis - Coursera Assignment 2

#6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#   in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen 
#   greater changes over time in motor vehicle emissions?

#Load data files
NEI <- readRDS("C:/Users/tsc029/Desktop/R/summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge files by mobile-derived sources
all.motor <- subset(NEI, type = "ON-ROAD") 
all.motor <- transform(all.motor, year = factor(year))
#Subset by location
LA.mobile <- subset(all.motor, fips == "06037")
BM.mobile <- subset(all.motor, fips == "24510")

png(file = "EDA_Plot6.png", width=700, height = 800, units= "px")
par(mfrow = c(1,2), mar= c(4, 4, 2, 1), oma = c(5, 5, 3, 1))
with(LA.mobile, plot(year, log10(Emissions), xlab = "Year", ylab = "PM2.5 Emissions (log10 tons)", main = "Los Angeles", font.lab = 2, col = "blue",  pch = 20, ylim= c(-12,5)))
with(BM.mobile, plot(year, log10(Emissions), xlab = "Year", ylab = "PM2.5 Emissions (log10 tons)", main = "Baltimore",  font.lab = 2, col = "blue",  pch = 20, ylim = c(-12, 5)))
mtext("Motor Vehicle Emissions (PM 2.5µm) in Los Angeles and Baltimore from 1999-2008", font = 2, cex = 1.4, outer = TRUE)
dev.off()
