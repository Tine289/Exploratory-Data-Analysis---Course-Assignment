## Exploratory Data Analysis - Coursera Assignment 2

#1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting 
#   system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Load data file
NEI <- readRDS("C:/Users/tsc029/Desktop/R/summarySCC_PM25.rds")

#Make base plot
png(file = "EDA_Plot1.png", width = 700, height = 480, units = "px")
boxplot(log10(Emissions) ~ year, data = NEI, xlab = "Year", ylab = "PM2.5 Emissions (log10 tons)", cex.lab = 1.2, font.lab = 2, col = "steelblue")
title(main="All-Source Particulate Matter (PM2.5µm) Emission \n in the United States from 1999 to 2008", font.main = 2, cex.main=1.5)
dev.off()

