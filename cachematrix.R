## These functions create a special object that stores a matrix and the inverse 
## of this matrix in the cache.

## makeCacheMatrix creates a list containing a function for

## set the array value
## get the value of the matrix
## set the value of the inverse of the matrix
## get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function()x
  setInv <- function(inv) m <<- inv
  getInv <- function() m 
  list(set = set, get = get, 
       setInv = setInv, 
       getInv = getInv)
}


## The "cacheSolve" function calculates the inverse of the special "matrix" 
## created with the previous function. Check if the inverse has already been 
## calculated. If so, it gets the inverse of the cache and skips the calculation. 
## Otherwise, it computes the inverse of the array and sets the value of the inverse 
## in the cache using the setInverse function.

cacheSolve <- function(x, ...) {
  m <- x$getInv()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  ma <- x$get()
  m <- solve(ma,...)
  x$setInv(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
