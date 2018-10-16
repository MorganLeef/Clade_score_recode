setwd ("~/desktop/ESDA/GitHub_Ex/GitHubEx2")

library(readxl)

#Load JL's first file "Matrices 461-470(1).xlsx" into R
x_data <- read_xlsx("Matrices 461-470(1).xlsx")

#Create a vector with the names of each sheet from "x_data"
sheets <- excel_sheets("Matrices 461-470(1).xlsx")

#Create a matrix with only the numerical data values from "x_data"
data_tb <- x_data[2:55,3:22]

data_x[data_x$Ancestor == 1, "Ancestor"] <- 0