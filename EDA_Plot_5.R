## Exploratory Data Analysis - Coursera Assignment 2

#5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2)
#Load data file
NEI <- readRDS("C:/Users/tsc029/Desktop/R/summarySCC_PM25.rds")

#Factorize type and Subset motor vehicle sources in Baltimore
NEI <- transform(NEI, type = factor(type))
motor.baltimore <- subset(NEI, fips =="24510" & type == "ON-ROAD")

str(motor.baltimore)

#Make ggplot 
png(file = "EDA_Plot5.png")
g <- ggplot(motor.baltimore,aes(year, log10(Emissions)))
g+  geom_point(color="steelblue", size = 2, alpha = 1/2)+  geom_smooth(method="lm")+  
  labs(title = "Motor Vehicle Sources of Particulate Matter (PM2.5µm) \nEmission in Baltimore City from 1999-2008")+  
  labs(x= "Year")+  labs(y= expression ("log "*PM[2.5]))+
  theme(
    plot.title = element_text(color="blue", size=16, face="bold", hjust = 0.5),
    axis.title.x = element_text(color= "black", size=16, face="bold"),
    axis.title.y = element_text(color = "black", size=16, face="bold"),
    axis.text.x = element_text(color= "black", size=12, face="bold"),
    axis.text.y = element_text(color = "black", size=12, face="bold")
  )

dev.off()     
