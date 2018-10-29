#R script that reads JL's excel file and extracts information including first column, species name, and group name.   

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

#Load "tidyr" package to use "fill"
library(tidyr)

#Use "fill" to occupy empty cells with group names
group <- x_data %>% fill(3,1)

#Exracting the first column from the matrix and naming it "V1"
V1 <- data_tb[,1]

#unlisting the tb. 
V1_un<-unlist(V1[1:55,1])

#Changes the values for it to change. I changed 1's to 0 and everything else to -999. 
recode(V1_un,"c(1)='0';else='-999'")
