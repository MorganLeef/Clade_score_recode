recoding_fun <-function(orig_column){
  
  if (orig_column[55]==1) {
   orig_column[1:55][orig_column[1:55]==1 ] <- -888 #will be changed to 0
  } else if (orig_column[55]==2) {
    orig_column[1:55][orig_column[1:55]==2 ] <- -777 #will be changed to 0
  }
  
  orig_column[1:55][orig_column[1:55]==0] <- orig_column[55] #replace all 0s with value in last row (ancestor)
  orig_column[1:55][orig_column[1:55]==-888] <- 0 #change placeholder value to 0
  orig_column[1:55][orig_column[1:55]==-777] <- 0 #chnage placeholer value to 0
  orig_column[1:55][orig_column[1:55]==2] <- -1 #change all remaining 2's to -1
  
  return(orig_column)
  
}

