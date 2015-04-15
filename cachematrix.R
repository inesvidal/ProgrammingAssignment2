## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.
## The variable 'inv' is used to keep the inverse, its value is NULL until the
## inverse has been cached

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    # Store the original matrix within the "special matrix", mark the inverse as 
    # NULL, i.e. not available
    setmat <- function (y) {
        x <<- y
        inv <<- NULL        
    }
    
    # Retrieve the original matrix from inside the "special matrix"
    getmat <- function() x
    
    # Set the inverse in the variable "inv"
    setinv <- function(inverse) inv <<- inverse
    # Get the inverse from the variable "inv"
    getinv <- function() inv
    
    # create the special object with all the methods
    list(setmat = setmat, getmat = getmat,
         setinv = setinv,
         getinv = getinv)
}


cacheSolve <- function(x, ...) {
    # Retrieve the value of the inverse from the "special matrix" created
    inv <- x$getinv()
    
    # The inverse is available (already stored in the "special matrix"), 
    # i.e. inv =! NULL
    if(!is.null(inv)) {
        message("getting cached data (inverse)")
        
        # return the inverse value and exit function
        return(inv)
    }
    
    # The inverse is not available, i.e. inv = NULL
    # Retrieve the original matrix, compute inverse, cache inverse 
    # in the special matrix and return inverse.
    matrix <- x$getmat()
    inv <- solve(matrix, ...)
    x$setinv(inv)
    inv
}

