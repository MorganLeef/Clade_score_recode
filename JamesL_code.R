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

#James L Problem Part 2

library("dplyr")

#Changes the column header "1" to "A" so it can be called.
colnames(V1)[colnames(V1)=="1"] <- "A"

#Checks row 55 for 1's and 2's, and if present, changes the values of the entire column to 0.
if(V1 [55,] == 1){
  V1$A<-recode(V1$A,"1='0'")
} else if(V1 [55,] == 2){
  V1$A<-recode(V1$A,"2='0'")
}

#Checks for existing zeroes, and if present, changes the zeroes to whatever value is in template row 55
if(V1 [55,1] != 0){
  V1$A<-recode(V1$A,"0='[55,1]'")
}

#Changes all remaining twos to -1
if(V1 [,] == 2){
  V1$A<-recode(V1$A,"2='1'")
}
  




#crap
V1$A<-recode(V1$A,"c(1,2)='0'")
#kinda works
V1[55,1] <- ifelse(V1[55,1] == "2", 0, ifelse(V1[55,1] == "1", 0, ifelse(V1[55,1] == "0", 0)))
