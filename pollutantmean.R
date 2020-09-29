##This function named 'pollutantmean' calculates the mean of a pollutant 
##(sulfate or nitrate) across a specified list of monitors. The function 
##'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
##Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
##particulate matter data from the directory specified in the 'directory' 
##argument and returns the mean of the pollutant across all of the monitors, 
##ignoring any missing values coded as NA.


pollutantmean <- function(directory, pollutant, id = 1:332) {
    	## Get a list of filenames
	filenames <- list.files(path="directory", pattern="*.csv")
      vals <- vector()  ## Initialize a vector to hold values

      for(i in id) {
		## Pad the i to create a filename
            filename <- sprintf("%03d.csv", i)
            filepath <- paste(directory, filename, sep="/")
                 
		data <- read.csv(filepath)
		if(pollutant == "sulfate"){
			d<-data[,2]
			d<-d[!is.na(d)]
		}else{
			d<-data[,3]
			d<-d[!is.na(d)]
		}
		vals<-c(vals,d)
	}
	mean<-round(mean(vals),3)
	mean
}
 pollutantmean("specdata","sulfate",id=1:10)

pollutantmean("specdata", "nitrate", 70:72)