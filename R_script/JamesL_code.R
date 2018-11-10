
#Deletes current working enviroment. 
rm(list=ls())
#load packages needed for script. 
library(readxl) 
library(tidyverse)
library(tidyr)

files <- list.files("~/Desktop/ESDA/exercises/JLR_project/raw_data")

for (i in files) {

xfile_name <- i

x_data <- read_excel(xfile_name)
sheet_name <- excel_sheets(xfile_name)
species <- rbind(x_data[2:55,2], "ancestor")
group <- pull((fill(x_data, 1, .direction = "down")[1:(nrow(x_data)-1),]), var = 1)
for (x in sheet_name) {
data_tb <- read_excel(xfile_name, sheet=sheet_name[1], range="R4C3:R58C22",col_names = FALSE)

orig_column <- pull(data_tb, X__1) 


source("recoding_column_function.R")

assign(paste0((x), "d"), apply(data_tb, 2, recoding_fun))
}}



