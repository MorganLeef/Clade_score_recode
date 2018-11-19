
#Deletes current working enviroment. 
rm(list=ls())
#load packages needed for script. 
library(readxl) 
library(tidyverse)
library(tidyr)

#Provides path to Matrices files, and creates an object

files <- list.files("./raw_data")



#Loops code that partitions each file for reformatting in preparation for the recoding function
for (xfile_name in files) {

  x_data <- read_excel(paste0("R_script/", xfile_name)) #you are not in your WD
  sheet_name <- excel_sheets(paste0("R_script/", xfile_name)) #you are not in your WD
  species <- rbind(x_data[2:55,2], "ancestor")
  group <- pull((fill(x_data, 1, .direction = "down")[1:(nrow(x_data)-1),]), var = 1)

    for (x in sheet_name) {
    data_tb <- read_excel(paste0("R_script/", xfile_name), sheet=x[1], range="R4C3:R58C22",col_names = FALSE)
    
    orig_column <- pull(data_tb, X__1) 
  
    #Source recoding column function that recodes values in a matrix
    source("recoding_column_function.R")
    
    #Applies the recoding function to each matrix
    assign(paste0((x), "d"), apply(data_tb, 2, recoding_fun))
    dataframe_list = grep("\\w+\\s\\w+d", ls(), value=T)
    }
  }

#Calculates scores and weighted scores (means for each species (total of values divided by the number of columns))
for (y in dataframe_list) {
assign(y, (cbind(get(y), "mean"=rowMeans(get(y)))))
assign(y, cbind(species, get(y)))
 }





##This is a great leap forward.  I had to make some changes to get it to run in its current 
##directory.  Also, you will want to find a way to label the summary cols appropriately
##and get the final rowMeans into a single dataframe so that you can summarize by group and 
##clade.  That's for next week!
