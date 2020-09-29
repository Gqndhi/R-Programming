##This function takes a directory of data files and a threshold for 
##complete cases and calculates the correlation between sulfate and nitrate 
##for monitor locations where the number of completely observed cases 
##(on all variables) is greater than the threshold. 
##The function returns a vector of correlations for the monitors 
##that meet the threshold requirement. If no monitors meet the threshold 
##requirement, then the function returns a numeric vector of length 0. 

corr <- function(dir,threshold=0){
	
	full <- complete(dir, 1:332)
    	full <- subset(full, nocs > threshold )

	correlations<-vector()##Initializing Empty Vector
	
	for(i in full$id){
		filename<-sprintf("%03d.csv",i)
		filepath<-paste(dir,filename,sep="/")##Creating filepath

		data<-read.csv(filepath) ##Loading the data
		X<-na.omit(data) ##Removing all rows with NA
		count<-nrow(X) 
		##Getting the correlation if count>threshold
		if(count >= threshold){
			correlations <- c(correlations, cor(X$nitrate, X$sulfate))
		}
	}
	correlations
}

	