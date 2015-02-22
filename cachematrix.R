## This R code contains a pair of functions that can cache the inverse of a matrix.
## The first function creates a special "matrix" object that can cache its inverse
## and the second function computes the inverse of the special "matrix" 
## returned by the first function.

## Creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) inv <<- solve
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)     
}

## Computes the inverse of the special "matrix" returned 
## by makeCacheMatrix

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv   
}
