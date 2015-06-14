##Coursera - RProgramming, Week 2, Assignment 1, Part 1
##Pollutantmean
##This function loops over a directory of .csv files and calculates the mean
##of monitoring values

##Declares the function - 3 variables = Directory, Column to Calc Mean,
##and list of csv files
pollutantmean <- function(directory, pollutant, id = 1:332){
  
       ##lists the file names ending with .csv
       filenames <- list.files(path=directory, pattern="*.csv")
       ##declares a holding variable for the column in the csv's
       vals <- vector()
       ##loops through numbers 1 to 332 (range of id)
       for(i in id){
             ##declares the filenames to be any 3 numbers + .csv as an integer
             filename = sprintf("%03d.csv", i)
             ##sets the filepath by copying directory & filenames
             filepath <- paste(directory, filename, sep="/")
             ##reads the data from each filepath
             data <- read.csv(filepath)
             ##loads the data into a single data frame "pollutant"
             d<- data[,pollutant]
             ##null handling
                 d <- d[!is.na(d)]
             ##loads data into vals
             vals = c(vals,d)
       }
   ##Takes the average of the value
   round(mean(vals), 3)
}
