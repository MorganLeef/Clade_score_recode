#practice script;
#practice code that changes 1 to 0 and everything else -999. 
recode(V1_un,"c(1)='0';else='-999'")

#This changes all the 2 to zeros and then everything else to 2's. 
recode(V1_un,"c(2)='0';else=c(0)='2'")
