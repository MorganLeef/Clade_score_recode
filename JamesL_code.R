
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

  x_data <- read_excel(paste0("raw_data/", xfile_name)) #you are not in your WD
  sheet_name <- excel_sheets(paste0("raw_data/", xfile_name)) #you are not in your WD
  species <- rbind(x_data[2:55,2], "ancestor")
  group <- pull((fill(x_data, 1, .direction = "down")[1:(nrow(x_data)-1),]), var = 1)

    for (x in sheet_name) {
    data_tb <- read_excel(paste0("raw_data/", xfile_name), sheet=x[1], range="R4C3:R58C22",col_names = FALSE)
    
    orig_column <- pull(data_tb, X__1) 
  
    #Source recoding column function that recodes values in a matrix
    source("recoding_column_function.R")
    
    #Applies the recoding function to each matrix
    assign(paste0((x), "d"), apply(data_tb, 2, recoding_fun))
    dataframe_list = grep("\\w+\\s\\w+d", ls(), value=T)
    }
}

summary <- matrix(nrow = 55)
#Calculates scores and weighted scores (means for each species (total of values divided by the number of columns))
for (y in dataframe_list) {
v <- rowMeans(get(y))
summary <- cbind(summary,v)
}

summary <- summary [,-1]
colnames(summary) <- dataframe_list

#creates clade scores for each species
Xiphosura <- as.data.frame(colMeans(summary[1:54,]))
colnames(Xiphosura)[colnames(Xiphosura)=="colMeans(summary[1:54, ])"] <- "Xiphosura clade score"


Bellinurina <- as.data.frame(colMeans(summary[12:18,], na.rm=TRUE))
colnames(Bellinurina)[colnames(Bellinurina)=="colMeans(summary[12:18, ], na.rm = TRUE)"] <- "Bellinurina clade score"

Limulina <- as.data.frame(colMeans(summary[19:54,], na.rm=TRUE))
colnames(Limulina)[colnames(Limulina)=="colMeans(summary[19:54, ], na.rm = TRUE)"] <- "Limulina clade score"

Paleolimulidea <- as.data.frame(colMeans(summary[22:25,], na.rm=TRUE))
colnames(Paleolimulidea)[colnames(Paleolimulidea)=="colMeans(summary[22:25, ], na.rm = TRUE)"] <- "Paleolimulidea clade score"

Austrolimulidae <- as.data.frame(colMeans(summary[26:34,], na.rm=TRUE))
colnames(Austrolimulidae)[colnames(Austrolimulidae)=="colMeans(summary[26:34, ], na.rm = TRUE)"] <- "Austrolimulidae clade score"

Limulidae <- as.data.frame(colMeans(summary[35:54,], na.rm=TRUE))
colnames(Limulidae)[colnames(Limulidae)=="colMeans(summary[35:54, ], na.rm = TRUE)"] <- "Limulidae clade score"

Grand_clade_scores <- cbind(Xiphosura, Bellinurina, Limulina, Paleolimulidea, Austrolimulidae, Limulidae)

#added the species to the summery dataset
summary<-cbind(group,species,summary)
colnames(summary)[colnames(summary)=="X__2"] <- "species"
#writes it as a csv
write.csv(Grand_clade_scores, file = "Grand_clade_scores.csv")
write.csv(summary, file = "summary.csv")
