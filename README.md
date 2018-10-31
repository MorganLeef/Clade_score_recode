ESDA James L. Problem EX

Included:
  Assignment description
  File Description
  Getting Started
    Challenges
    Prerequisites necessary

Assignment Details:
The purpose of this project is to automate the preparation of James Lamdsdell's .xlsx files for recoding.

File Description:
These Excel files (Matrices 461-470.xlsx) consist of multiple sheets of numerical matrix data that will be recoded based on a template "Ancestor" row on the bottom of each sheet.

Getting Started:
  For this stage of the project, vectors and matrices are extracted from the original files, so that they can be inserted into functions for the second stage of the project. 
  This code extracts the numerical data from the xlsx as a matrix, fills empty cells that would inhibit the use of some functions, and enables the extraction of any column so that the numeric values can be edited. 

  The second stage of the project implements code that will be tested on a single column of the data, assuring that it will perform the desired tasks accordingly. This involves:
  1.)Searching the template row for a value of one or two, and when found, the code will replace all the matching values in the corrosponding column with a value of zero.
  2.)Afterwards, all remaining two values in the matrix are replaced with a value of -1.
  
  Prerequisites:
    The "readxl", "tidyr" and "dplyr" R packages are required to successfully run this code.	

Authors:
Morgan Leef
Amanda Adams
=======
This code will use the R package readxl to read all of the data contained in XLS files given to us by James L.(Examples included here are...) The code will read the XL files and extracts the first column, species, excels sheets and group names. Then using a pulled first collumn to recode the collumns.  






Functions/package used in this R script:


Library ()=adding the new packaging to use in the code.

Read_xlsx()=this part of the code that reads the excel file. 

Excel_sheets()=this part of the code help create a vector for all the sheet names. 

pull()= pulling the data from tibble and turing it into a vector.

Na.omit()=this function omits all of the N/A from the column. 

Rep()=this replicates the information in the () as many times as someone would want.

    





Data background:

There are two excel files that are being used for the overall problem. The two files are Matrices 461-470(1).xlsx and Matrices 471-480(1).xlsx. 

This code will use Matrices 461-470(1).xlsx. 

The group names are:
•	Xiphosura
•	Bellinurina
•	Limulina
•	Paleolimulidea
•	Austrolimulidae
•	Limulidae


The species names are:
•	Lunataspis_aurora
•	Kasibelinurus_amicorum
•	Kasibelinurus_randalli
•	Bellinurus_trilobitoides
•	Bellinurus_bellulus
•	Bellinurus_truemanii
•	Bellinurus_reginae
•	Bellinurus_arcuatus
•	Bellinurus_lunatus
•	Euproops_danae
•	Euproops_sp
•	Euproops_anthrax
•	Euproops_mariae
•	Euproops_rotundatus
•	Liomesaspis_laevis
•	Anacontium_carpenteri
•	Alanops_magnifica
•	Pringlia_birtwelli
•	Bellinuroopsis_rossicus
•	Rolfeia_fouldenensis
•	Valloisella_lievensis
•	Paleolimulus_woodae
•	Paleolimulus_kunguricus
•	Paleolimulus_signatus
•	Xaniopyramis_linseyi
•	Paleolimulus_longispinus
•	Panduralimulus_babcocki
•	Psammolimulus_gottingensis
•	Limulitella_tejraensis
•	Limulitella_bronni
•	Paleolimulus_fuchsbergensis
•	Dubbolimulus_peetae
•	Vaderlimulus_tricki
•	Austrolimulus_fletcheri
•	Limulitella_henkeli
•	Yunnanolimulus_luopingensis
•	Tarracolimulus_rieki
•	Limulitella_vicensis
•	Mesolimulus_crespelli
•	Mesolimulus_sp
•	Mesolimulus_walchi
•	Limulus_woodwardi
•	Casterolimulus_kletti
•	Vicatlimulus_mcqueeni
•	Heterolimulus_gadeai
•	Carcinoscorpius_rotundicauda
•	Tachypleus_gigas
•	Tachypleus_decheni
•	Tachypleus_syriacus
•	Tachypleus_tridentatus
•	Limulus_darwini
•	Crenatolimulus_paluxyensis
•	Limulus_coffini
•	Limulus_polyphemus
