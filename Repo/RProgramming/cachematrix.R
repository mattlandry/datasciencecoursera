##    makeVector <- function(x = numeric()) {
##            m <- NULL
##            set <- function(y) {
##                    x <<- y
##                    m <<- NULL
##            }
##            get <- function() x
##            setmean <- function(mean) m <<- mean
##            getmean <- function() m
##            list(set = set, get = get,
##                 setmean = setmean,
##                 getmean = getmean)
##    }
##
##
##    cachemean <- function(x, ...) {
##            m <- x$getmean()
##            if(!is.null(m)) {
##                    message("getting cached data")
##                    return(m)
##            }
##            data <- x$get()
##            m <- mean(data, ...)
##            x$setmean(m)
##            m
##    }
## Write a short comment describing this function
## This function initializes an empty matrix object for caching

makeCacheMatrix <- function(m = matrix()) {
        
        ##This is goofy but I needed to create an inverse matrix so I
        ##initialized an object with last letter of "matrix"
        a <- NULL
        ##This sets the matrix, just like in the example
        set <- function( matrix ){
                m <<- matrix
                a <<- NULL
        }
        ##This gets the matrix, just like in the example
        get <- function() {
                m
        }
        ##This sets the mean, just like in the example
        setmean <- function(inverse){
                a <<- inverse
        }
        ##This gets the mean, just like in the example
        getmean <- function(){
                a
        }
        ##Returns this list
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmean()
        ##Return inverse here
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        ##Get the matrix
        data <- x$get()
        ##Matrix math determining the inverse
        m <- solve(data) %*% data
        ##Put the new inverse to the object
        x$setmean(m)
        ##return the new matrix
        m
}
