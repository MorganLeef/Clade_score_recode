#R script that reads JL's excel file and extracts information including first column, species name, and group name.    
#Sets up the working directory.
setwd ("~/desktop/ESDA/GitHub_Ex/GitHubEx2")

#Adds the readxl to the library. 
library(readxl)

#Load JL's first file "Matrices 461-470(1).xlsx" into R
x_data <- read_xlsx("Matrices 461-470(1).xlsx")

#Create a vector with the names of each sheet from "x_data"
sheets <- excel_sheets("Matrices 461-470(1).xlsx")

#Create a matrix with only the numerical data values from "x_data"
data_tb <- x_data[2:56,3:22]

#Extract the species names into their own vector
species <- x_data[2:55,2]

#Extract the names for the group and unlist function makes tbl not a list. 
names<-unlist(x_data[1:55,1]) 

#Got rid of the N/A values in the column.
groupnames<-na.omit(names)

#This creates a vector named groups to have all of the groupnames from column 1 of x_data.   
rep.groups <- rep(groupnames, c(3,16,3,4,9,19))

#This code takes away the X__* name from the rep.groups vector.  
groups<-unname(rep.groups)

#Exracting the first column from the matrix and naming it "V1"
V1 <- data_tb[,1]


