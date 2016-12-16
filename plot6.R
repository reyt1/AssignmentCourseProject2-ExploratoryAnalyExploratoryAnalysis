#6th question. Compare emissions Baltimore City and Los Angeles County
library(ggplot2)
library(dplyr)
BaltEmission<-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
LAemissions<-summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
BaltEmission$County <- "Baltimore City, MD"
LAemissions$County <- "Los Angeles County, CA"
BOTHemissions <- rbind(BaltEmission, LAemissions)

ggplot(BOTHemissions, aes(x=factor(year), 	
				y=Emissions, 
				fill=County,
				label = round(Emissions,2))) +
    		geom_bar(stat="identity", colour="black") +
    		facet_grid(County~., scales="free") +
    		ylab(expression("total PM"[2.5]*" emissions in tons")) + 
    		xlab("year") +
    		ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))+
    		geom_label(aes(fill = County),colour = "black", fontface = "bold")
