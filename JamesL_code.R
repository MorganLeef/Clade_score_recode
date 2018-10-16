setwd ("~/desktop/ESDA/GitHub_Ex/GitHubEx2")

library(xl)

x_data <- read_xlsx("Matrices 461-470(1).xlsx")

sheets <- excel_sheets(x_data)

data_tb <- matrix()

data_x[data_x$Ancestor == 1, "Ancestor"] <- 0