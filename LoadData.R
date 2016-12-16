# AssignmentCourseProject2-ExploratoryAnalysis
# Set working Directory
setwd("C:/Users/Reynaldo/Documents")
getwd()

#Create folder for the assignment
if(!file.exists("data")) dir.create("data")
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl,destfile="./data/EmissionData.zip",method="wininet")

#Zip the file data call Emission into EmissionData.zip file
zipfile.data <- "EmissionData.zip"
  
# make sure the data in the working directory if not download the zip file into the to zipfile.data and unzip the EmissionData and Load it.
if(!file.exists(zipfile.data)) {        
               unzip(zipfile="./data/EmissionData.zip",exdir="./data")
   } 
path_rf <- file.path("./data" , "EmissionData")
files<-list.files(path_rf, recursive=TRUE)
files

# Read data files
# 1st Read National Emissions Data

NEI <- readRDS("data/summarySCC_PM25.rds")
str(NEI)
dim(NEI) #6497651*6
head(NEI,3)

#2nd Read Source Code Classification data
SCC <- readRDS("data/Source_Classification_Code.rds")
str(SCC)
dim(SCC)  #11717*15
head(SCC)

#look into de folde data and you see at least 3 files: 
##EmissionData.zip, 
##Source_Classification_Code.rds
##summarySCC_PM25.rds
dir("./data")

# visualization
number.add.width<-800     # width length to make the changes faster
number.add.height<-800    # height length to make the changes faster
library(dplyr)
