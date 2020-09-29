##This function reads a directory full of files and reports the number of 
##completely observed cases in each data file. The function will return a 
##data frame where the first column is the name of the file and the second 
##column is the number of complete cases

complete<-function(dir,id=1:332){
	df <-(data.frame(id=integer(),nocs=integer()))##Empty DF for loading values
	k<-1
	for(i in id){
		filename<-sprintf("%03d.csv",i)
		filepath<-paste(dir,filename,sep="/")##Creating filepath

		data<-read.csv(filepath) ##Loading the data
		X<-na.omit(data) ##Removing all rows with NA
		df[k,1]<-i
		df[k,2]<-nrow(X)
		k<-k+1
		}
	df
	}
)		
		
		
		