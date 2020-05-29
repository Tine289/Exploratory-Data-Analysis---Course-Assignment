  ## Exploratory Data Analysis - Coursera Assignment
  
  #4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
  
  #Load data files
  NEI <- readRDS("C:/Users/tsc029/Desktop/R/summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  #Select coal-derived sources from SCC file
  SCC.coal <- SCC[grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE),]
  
  #Merge files by coal-derived sources
  us.coal <- merge(NEI, SCC.coal, by = "SCC")
  
  head(us.coal)
  str(us.coal)
  
  library(ggplot2)
  #Make scatterplot showing emission from coal-combustion across the US from 1999-2008 
  png(file = "EDA_Plot4.png", width = 600, height = 500, units = "px")
    g <- ggplot(us.coal,aes(year, log10(Emissions)))
    g+  
      geom_point(color="steelblue", size = 2, alpha = 1/2)+  
      geom_smooth(method="lm")+  
      labs(title = "Coal Combustion Emission (PM 2.5µm) \nin the United States from 1999 to 2008", hjust = 0.5)+  
      labs(x= "Year")+  labs(y= expression ("log "*PM[2.5] (tons)) ) + 
      theme(
        plot.title = element_text(color="blue", size=18, face="bold", hjust = 0.5),
        axis.title.x = element_text(color= "black", size=16, face="bold"),
        axis.title.y = element_text(color = "black", size=16, face="bold"),
        axis.text.x = element_text(color= "black", size=12, face="bold"),
        axis.text.y = element_text(color = "black", size=12, face="bold")
      )
    
  dev.off()