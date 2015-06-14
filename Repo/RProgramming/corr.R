##Coursera - RProgramming, Week 2, Assignment 1, Part 2
##corr.R
##This function loops over a directory of .csv files and calculates
##the correlation between two variables against a threshold requirement

##Declares the function - 2 variables = directory, threshold
corr <- function(directory, threshold = 0){
        
        ##Establishes complete directory search of all files
        completes <- complete(directory, 1:332)
        ##Of the complete directory, which subset is above the threshhold
        ##I still don't understand why we are picking a threshhold
        completes <- subset(completes, nobs > threshold)
        
        ##Initialize the correlation variable
        correlation <- vector()
        
        ##Loop over the passed id's
        for(i in completes$id) {
                
                #Create the filenames
                filename <- sprintf("%03d.csv", i)
                filepath <- paste(directory, filename, sep="/")
                #Load data
                data <- read.csv(filepath)
                ##Calculate the complete cases
                completeCases <- data[complete.cases(data),]
                count <- nrow(completeCases)
                ##If threshhold is reached
                if(count >= threshold) {
                        correlation <- c(correlation, cor(completeCases$nitrate, completeCases$sulfate))
                }
        }
        
        correlations
}