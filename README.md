# ESDA James L. Problem EX

## Included:

+ Assignment description
+ File Description
+ Getting Started _etc_
    Second Stage
	Third Stage
	Summary Data
+Required Packages & used functions
+Final csv files
	
    

### Assignment Details:

The purpose of this project was to automate the reorganization, recoding, and summarization of the species data contained in each of 
Dr.Lamdell's matrix files.

### File Description:

The Excel files (Matrices 461-470.xlsx & Matrices 471-480.xlsx) consist of multiple sheets of numerical matrix data that will be recoded based on a template "Ancestor" row on the bottom of each sheet.

### Getting Started:

  Vectors and matrices were extracted from the original .xlsx files, so that they could be inserted into functions for the second stage of the project. This code extracts the numerical data from the xlsx as a matrix, fills empty cells that would inhibit the use of some functions, and enables the extraction of any column so that the numeric values can be edited. 

  The second stage of the project implemented code that was tested on a single column of the data, assuring that it would perform the   desired tasks accordingly. This involved:

  1. Searching the template row for a value of one or two, and when found, the code will replace all the matching values in the              corrosponding column with a value of zero.

  2. Afterwards, all remaining two values in the matrix are replaced with a value of -1.

### Example Code:			
```r
		if (orig_column[55]==1) {
		orig_column[1:54][orig_column[1:54]==1 ] <- -888 #will be changed to 0
		} else if (orig_column[55]==2) {
			orig_column[1:54][orig_column[1:54]==2 ] <- -777 #will be changed to 0
		}
		orig_column[1:55][orig_column[1:55]==0] <- orig_column[55] #replace all 0s with value in last row (ancestor)
		orig_column[1:54][orig_column[1:54]==-888] <- 0 #change placeholder value to 0
		orig_column[1:54][orig_column[1:54]==-777] <- 0 #chnage placeholer value to 0
		orig_column[1:54][orig_column[1:54]==2] <- -1 #change all remaining 2's to -1
		orig_column[55] <- 0
		return(orig_column) 
```
		
		
The above conditional has been implemented into a function.
  
  In the third stage of the project, functions are used to easily perform all of the tasks described in the second stage. With a separate R script, these functions can be sourced, and finally, implemented into code that modifies any column of the data with "apply". Example: newdata < apply(data_tb2, (column number),recoding_fun) where data_tb2 is the adjusted matrix created   in the first stage, and recoding_fun is the function created in the second stage that changes all current data values based on the specifications established in the second stage.
  *Edit - The most recent version applies the function to each matrix (data_tb) in each sheet of the workbook, for multiple files
  
  
  The last set of code provides summary data for each species. It calculates the means for each species, by dividing the total value for   each species by the number of columns.
  

## Functions/packages used in this R script:

#### Packages:
    The "readxl", "tidyr",and "tidyverse" R packages are required to successfully run this code.

#### Functions
Library() #loads the required packages into the current environment 

Read_xlsx() #used to read in .xlsx files into the environment 

Excel_sheets() #allows the naming and separation of the sheets in the workbook

pull() #pulls data from a tibble and inserts it into a new vector 

Rep() #used to replicate the characters/numbers specified in the () into other columns/rows

assign() #used to assign a value to a name in the current environment

get() #used to search by name, for an object in the environment
    
grep() #used to search for matches to an argument in the current environment

cbind() #used to take sequences of various arguments and combine by rows or columns

apply() #returns a vector, list, or array by applying a function to the margins of another matrix or array



## Data background:

"Matrices 461-470.xlsx" and "Matrices 471-480.xlsx" are the files that were used in this project. The functions and code were applied to
the data in these files.


### Example group names:
```
•	Xiphosura

•	Bellinurina

•	Limulina

```

### Example species names:
```
•	Lunataspis aurora
•	Kasibelinurus amicorum
•	Kasibelinurus randalli
•	Bellinurus trilobitoides
```

## Authors:
Morgan Leef,
Amanda Adams and 
Autum Downey
