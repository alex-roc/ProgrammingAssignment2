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

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
}
