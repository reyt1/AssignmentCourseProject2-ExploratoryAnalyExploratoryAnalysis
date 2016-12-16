#5th question, emissions from motor vehicle-Baltimore city
library(ggplot2)
library(dplyr)
BaltimoreEmissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
BalbyYear <- summarise(group_by(BaltimoreEmissions, year), Emissions=sum(Emissions))
ggplot(BalbyYear, aes(x=factor(year), 
				y=Emissions,
				fill=year, 
				label = round(Emissions,2))) +
    				geom_bar(stat="identity", colour="black") +
    				xlab("year") +
    				ylab(expression("total PM"[2.5]*" emissions in tons")) +
    				ggtitle("Emissions from motor vehicle sources in Baltimore City")+
    				geom_label(aes(fill = year),colour = "white", fontface = "bold")
