## Exploratory Data Analysis - Coursera Assignment

# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases 
# in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

#Load data file
NEI <- readRDS("C:/Users/tsc029/Desktop/R/summarySCC_PM25.rds")

#Subset Baltimore and factorize type
Baltimore <- subset(NEI, fips=="24510")
Baltimore <- transform(Baltimore, type = factor(type))
str(Baltimore)

#Scatterplot for each of emission sources in Baltimore from 1999-2008
png(file = "EDA_Plot3.png", width = 800, height = 800, units = "px")
g <- ggplot(Baltimore,aes(year, log10(Emissions)))
g+  geom_point(color="steelblue", size = 2, alpha = 1/2)+  geom_smooth(method="lm")+  
  facet_grid(.~type)+  labs(title = "Disparate Sources of Particulate Matter (PM2.5µm) Emission\nin Baltimore City from 1999-2008")+  
  labs(x= "Year")+  labs(y= expression ("log "*PM[2.5]) )+ 
  theme(
    plot.title = element_text(color="blue", size=20, face="bold", hjust = 0.5),
  axis.title.x = element_text(color= "black", size=16, face="bold"),
  axis.title.y = element_text(color = "black", size=16, face="bold"),
  axis.text.x = element_text(color= "black", size=12, face="bold"),
  axis.text.y = element_text(color = "black", size=12, face="bold"),
  strip.text.x = element_text(size = 12, color = "red", face = "bold")
  )

dev.off()     
