## This R code contains a pair of functions that can cache the inverse of a matrix.
## The first function creates a special "matrix" object that can cache its inverse
## and the second function computes the inverse of the special "matrix" 
## returned by the first function.


## Creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL   # Initialize or clear the inv variable
    
    # Set the matrix 
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    get <- function() x                           # Return the matrix
    setinverse <- function(solve) inv <<- solve   # Set the inverse of the matrix
    getinverse <- function() inv                  # Return the inverse of the matrix
    
    # Return the list of functions
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)     
}


## Computes the inverse of the special "matrix" returned by makeCacheMatrix
## through the solve() function

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()    # Return the invrerse of the matrix
    
    # If the inverse of the matrix was alreahdy computed, then return the cached value
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    
    data <- x$get()           # Return the matrix
    inv <- solve(data, ...)   # Compute the inverse of the matrix                      
    x$setinverse(inv)         # Pass the new inverse matrix computed
    inv                       # Return the new inverse matrix computed
}
