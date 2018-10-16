setwd ("~/desktop/ESDA/GitHub_Ex/GitHubEx2")

library(readxl)

#Load JL's first file "Matrices 461-470(1).xlsx" into R
x_data <- read_xlsx("Matrices 461-470(1).xlsx")

#Create a vector with the names of each sheet from "x_data"
sheets <- excel_sheets("Matrices 461-470(1).xlsx")

#Create a matrix with only the numerical data values from "x_data"
data_tb <- x_data[2:56,3:22]

#Extract the species names into their own vector
species <- x_data[2:55,2]

#Create a new "group" vector that contains repeats for all groups
group <- rep((c(3,1) times = 3), (c(6,1) times = 16), (c(22,1) times = 3), (c(25,1) times = 4), (c(29,1) times = 9), (c(38,1) times = 19))

#Exracting the first column from the matrix and naming it "V1"
V1 <- data_tb[,1]