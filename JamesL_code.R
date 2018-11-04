#R script that recodes all the matrix into what is needed. 

rm(list=ls())

library(readxl) #included in tidyverse
library(tidyverse)

#Read in one of Lamsdell's excel files and reshape
xfile_name <- "Matrices 461-470.xlsx"

x_data <- read_excel(xfile_name)
sheet_name <- excel_sheets(xfile_name)
n_sheets <- length(sheets)
species <- rbind(x_data[2:55,2], "ancestor")
group <- pull((fill(x_data, 1, .direction = "down")[1:(nrow(x_data)-1),]), var = 1)

data_tb <- read_excel(xfile_name, sheet=sheet_name[1], range="R4C3:R58C22", 
                      col_names = FALSE)

v1 <- pull(data_tb, X__7) #creates a single vector from the tbl
####Becomes Function paleo_f.R

    if (v1[55]==1) {
      v1[1:54][v1[1:54]==1 ] <- -888 #will be changed to 0
    } else {if (v1[55]==2)
      v1[1:54][v1[1:54]==2 ] <- -777 #will be changed to 0
    }

v1[1:54][v1[1:54]==0] <- v1[55] #replace all 0s with value in last row (ancestor)

v1[1:54][v1[1:54]==-888] <- 0
v1[1:54][v1[1:54]==-777] <- 0
v1[1:54][v1[1:54]==2] <- -1

