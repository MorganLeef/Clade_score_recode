#R script that reads JL's excel file and extracts information including first column, species name, and group name.   

rm(list=ls())

library(readxl) 
library(tidyverse)
library(tidyr)


#Read in one of Lamsdell's excel files and reshape
xfile_name <- "Matrices 461-470(1).xlsx"

x_data <- read_excel(xfile_name)
sheet_name <- excel_sheets(xfile_name)
n_sheets <- length(sheet_name)
species <- rbind(x_data[2:55,2], "ancestor")
group <- pull((fill(x_data, 1, .direction = "down")[1:(nrow(x_data)-1),]), var = 1)

data_tb2 <- read_excel(xfile_name, sheet=sheet_name[1], range="R4C3:R58C22",col_names = FALSE)

v1 <- pull(data_tb2, X__2) #creates a single vector from the tbl
####Becomes Function paleo_f.R
#Creates a function that changes values based on James L desires for each column
v1_fun<-function(runs){
  
if (runs[55]==1) {
    runs[1:54][runs[1:54]==1 ] <- -888 #will be changed to 0
} else {if (runs[55]==2)
    runs[1:54][runs[1:54]==2 ] <- -777 #will be changed to 0
}

runs[1:54][runs[1:54]==0] <- runs[55] #replace all 0s with value in last row (ancestor)

runs[1:54][runs[1:54]==-888] <- 0
runs[1:54][runs[1:54]==-777] <- 0
runs[1:54][runs[1:54]==2] <- -1

return(runs)

}
v1_fun(runs=v1)
