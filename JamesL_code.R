#R script that recodes all the matrix into what is needed. 

rm(list=ls())

library(readxl) #included in tidyverse
library(tidyverse)

#Read in one of Lamsdell's excel files and reshape
x_data <- read_xlsx("Matrices 461-470(1).xlsx")
sheets <- excel_sheets("Matrices 461-470(1).xlsx")
n_sheets <- length(sheets)
group <- x_data %>% fill(3,1)
v1vec<-pull (v1)

V1_fun<-function(v1vec){
  
if (v1vec[55]==1) {
  v1vec[1:54][v1vec[1:54]==1 ] <- -888 #will be changed to 0
} else {if (v1vec[55]==2)
  v1vec[1:54][v1vec[1:54]==2 ] <- -777 #will be changed to 0
}

v1vec[1:54][v1vec[1:54]==0] <- v1vec[55] #replace all 0s with value in last row (ancestor)

v1vec[1:54][v1vec[1:54]==-888] <- 0
v1vec[1:54][v1vec[1:54]==-777] <- 0
v1vec[1:54][v1vec[1:54]==2] <- -1
 
return(v1vec)
}

