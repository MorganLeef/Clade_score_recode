#This new R script sources the code from James L's original code, and uses apply to run the function changing the valuse for any specified column in the matrix
##Very Nice Job!
#Deletes everything in the environment. 
rm(list=ls())

#Source code and function from James L R script
source("JamesL_code.R")

#Apply this function to any specified column
coded_m <- apply(data_tb2, 2, v1_fun)
