# ESDA James L. Problem EX

## Included:

+ Assignment description
+ File Description
+ Getting Started _etc_
    Second Stage
	Third Stage
	Summary Data
    Prerequisites

### Assignment Details:

The purpose of this project is to automate the preparation of James Lamdsdell's .xlsx files for recoding - _how?_

### File Description:

The Excel files (Matrices 461-470(1).xlsx) consist of multiple sheets of numerical matrix data that will be recoded based on a template "Ancestor" row on the bottom of each sheet.

### Getting Started:

  Vectors and matrices are extracted from the original xlsx files, so that they can be inserted into functions for the second stage of the project. 
  This code extracts the numerical data from the xlsx as a matrix, fills empty cells that would inhibit the use of some functions, and enables the extraction of any column so that the numeric values can be edited. 

  The second stage of the project implements code that will be tested on a single column of the data, assuring that it will perform the desired tasks accordingly. This involves:

1. Searching the template row for a value of one or two, and when found, the code will replace all the matching values in the corrosponding column with a value of zero.

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
  
  The third stage of the project uses functions to easily perform all of the tasks described in the second stage. With a separate R script, these functions can be sourced, and finally, implemented on any column of 
  the data with "apply". Example: newdata <- apply(data_tb2, (column number),recoding_fun) where data_tb2 is the adjusted matrix created in the first stage, and recoding_fun is the function created in the second stage that changes all
  current data values based on the specifications established in the second stage.
  *Edit - The most recent version applies the function to each matrix (data_tb) in each sheet of the workbook
  
  The last set of code provides summary data for each species. It calculates the means for each species, by dividing the total value for each species by the number of columns.
  
  

Authors: _MOVE TO BOTTOM_
Morgan Leef,
Amanda Adams and 
Autum Downey
=======
This code will use the R package readxl to read all of the data contained in XLS files given to us by James L.(Examples included here are...) The code will read the XL files and extracts the first column, species, excels sheets and group names. Then using a pulled first collumn to recode the collumns.  






## Functions/packages used in this R script:

_Which Packages?_

#### Prerequisites:
    The "readxl", "tidyr",and "tidyverse" R packages are required to successfully run this code.

#### Functions
Library ()=adding the new packaging to use in the code.

Read_xlsx()=this part of the code that reads the excel file. 

Excel_sheets()=this part of the code help create a vector for all the sheet names. 

pull()= pulling the data from tibble and turing it into a vector. 

Rep()=this replicates the information in the () as many times as someone would want.

assign()
    
grep()

cbind()

apply()



## Data background:

There are two excel files that are being used for the overall problem. The two files are Matrices 461-470(1).xlsx and Matrices 471-480(1).xlsx. 

This code will use Matrices 461-470(1).xlsx. 

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
