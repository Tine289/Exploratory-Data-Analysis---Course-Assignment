## Exploratory Data Analysis - Coursera Assignment


#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

#Load data
NEI <- readRDS("C:/Users/tsc029/Desktop/R/summarySCC_PM25.rds")

#Subset Baltimore (fips == 24510)
baltimore <- subset(NEI, fips=="24510")

#Make base plot
png(file= "EDA_Plot2.png", width = 700, height = 480, units = "px")
boxplot(log10(Emissions) ~ year, data=baltimore, ylim = c(-8, 4), xlab =  "Year", ylab = "PM2.5 Emissions (log10 tons)", col = "red")
title(main="All-Source Particulate Matter (PM2.5µm) Emission \nin Baltimore between 1999 and 2008", font.main= 2, cex.main = 1.5)
dev.off()