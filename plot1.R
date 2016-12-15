# 1st question, plot data into "plot1.png", width=number.add.width, height=number.add.height)
# Group total NEI emissions per year:
TotalEmissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
colorstoplot <- c("red", "deeppink3", "indianred1", "greenyellow")
x1<-barplot(height=TotalEmissions$Emissions/1000, 
	        	names.arg=TotalEmissions$year,
        	  xlab="years", 	
		        ylab=expression("total PM"[2.5]*"emission in kilotons"),
	         	ylim=c(0,8000),
          	main=expression("Total PM"[2.5]*"emissions at various years in kilotons"),
		        col=colorstoplot)

# Add text and dot lines at top of bars
text(x = x1, y = round(TotalEmissions$Emissions/1000,2), label = round(TotalEmissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")
lines(x = x1, y =TotalEmissions$Emissions/1000 , lwd = 1, lty = 3, col = 'black')
points(x = x1, y =TotalEmissions$Emissions/1000, pch = 20, col = 'steelblue')
