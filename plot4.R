#4th question, plot "plot4.png" emissions from coal combustion-related sources
library(ggplot2)
library(dplyr)

#Load combustion coal
combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[combustion.coal,]

#Find emissions from coal combustion-related sources
EmissionsCC <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]
EmissionsCR <- summarise(group_by(EmissionsCC, year), Emissions=sum(Emissions))
ggplot(EmissionsCR, aes(x=factor(year), 
                    y=Emissions/1000,
                    fill=year, 
                    label = round(Emissions/1000,2))) +
                    geom_bar(stat="identity", colour="black") +
                    xlab("year") +
                    ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
                    ggtitle("Emissions from coal combustion-related sources in kilotons")+
                    geom_label(aes(fill = year),colour = "white", fontface = "bold")
