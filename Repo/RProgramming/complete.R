##Coursera - RProgramming, Week 2, Assignment 1, Part 2
##complete.R
##This function loops over a directory of .csv files and reports the number
##of complete cases (rowcount, basically)

##Declares the function - 2 variables = directory, range of csv files
complete <- function(directory, id = 1:332) {
  
    ##lists the file names ending with csv
    filenames <- list.files(path=directory, pattern="*.csv")
    
    ##declares holding variables for all ids & counts
    ids <- vector()
    count = vector()
    
    ##loops through numbers 1 to 332 (range of id)
    for(i in id) {
      ##declares the filenames to be any 3 numbers + csv as an integer
      filename = sprintf("%03d.csv", i)
      ##sets the filepath by copying directory & filenames
      filepath <- paste(directory, filename, sep="/")
      ##reads the data from each filepath
      data <- read.csv(filepath)
      ##loads data into ids
      ids = c(ids, i)
      ##uses the complete.cases tool that assesses only observations that have
      ##no missing values across the entire sequence (row)
      numofobs = data[complete.cases(data),]
      ##counts the number of complete cases
      count = c(count, nrow(numofobs))
    }
    ##returns the IDs of the csvs and the count
    dt <- data.frame(id=ids, nobs=count)
    dt
}