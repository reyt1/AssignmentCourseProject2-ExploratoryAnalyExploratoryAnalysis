#3rd question, plot "plot3.png", width=number.add.width, height=number.add.height
#Group total NEI emissions per year:

library(ggplot2)
library(dplyr)
BaltEmissionsbyYear<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))
ggplot(BaltEmissionsbyYear, aes(x=factor(year),
				y=Emissions, 
                                fill=type,
                                label = round(Emissions,2))) +
                                geom_bar(stat="identity") +
                                facet_grid(. ~ type) +
                                xlab("year") +
                                ylab(expression("total PM"[2.5]*" emission in tons")) +
                                ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                       "City by various source types", sep="")))+
                                geom_label(aes(fill = type), colour = "white", fontface = "bold")

