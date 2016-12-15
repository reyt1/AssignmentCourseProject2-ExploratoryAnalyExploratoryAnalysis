BaltimoreCityEmissions<-summarise(group_by(filter(NEI, fips == "24510"), year), Emissions=sum(Emissions))
colorstoplot <- c("red", "deeppink3", "indianred1", "greenyellow")
x2<-barplot(height=BaltimoreCityEmissions$Emissions/1000, 
	        	names.arg=BaltimoreCityEmissions$year,
            xlab="years", 
	        	ylab=expression("total PM"[2.5]*"emission in kilotons"),
	        	ylim=c(0,4),
          	main=expression("Total PM"[2.5]*"emissions in Baltimore City-MD in kilotons"),col=colorstoplot)

# Add text and dot line at top of bars
text(x = x2, y = round(BaltimoreCityEmissions$Emissions/1000,2), label = round(BaltimoreCityEmissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")
lines(x = x2, y =BaltimoreCityEmissions$Emissions/1000 , lwd = 1, lty = 3, col = 'black')
points(x = x2, y =BaltimoreCityEmissions$Emissions/1000, pch = 20, col = 'steelblue')
