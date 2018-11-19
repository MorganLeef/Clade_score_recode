
#Deletes current working enviroment. 
rm(list=ls())
#load packages needed for script. 
library(readxl) 
library(tidyverse)
library(tidyr)

#Provides path to Matrices files, and creates an object
files <- list.files("../raw_data")

#Loops code that partitions each file for reformatting in preparation for the recoding function
for (i in files) {

xfile_name <- i

x_data <- read_excel(xfile_name)
sheet_name <- excel_sheets(xfile_name)
species <- rbind(x_data[2:55,2], "ancestor")
group <- pull((fill(x_data, 1, .direction = "down")[1:(nrow(x_data)-1),]), var = 1)
for (x in sheet_name) {
data_tb <- read_excel(xfile_name, sheet=sheet_name[1], range="R4C3:R58C22",col_names = FALSE)

orig_column <- pull(data_tb, X__1) 

#Source recoding column function that recodes values in a matrix
source("recoding_column_function.R")

#Applies the recoding function to each matrix
assign(paste0((x), "d"), apply(data_tb, 2, recoding_fun))
dataframe_list = grep("\\w+\\s\\w+d", ls(), value=T)
}}

#Calculates scores and weighted scores (means for each species (total of values divided by the number of columns))
for (y in dataframe_list) {
assign(y, (cbind(get(y), apply((get(y)[,]), 1, sum, na.rm=T))))
 assign(y, (cbind(get(y), (get(y)[,21])/(20))))
   }

