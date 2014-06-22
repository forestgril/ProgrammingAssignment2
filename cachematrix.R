## These functions allow to cache the result of matrix inversion in special
## objects by use of R language scoping rules applied with operator "<<-".

## Creates a special "wrapper" object for a matrix stored in memory together 
## with cached value of the matrix inversion, if it was already calculated 
## (and as long, as the matrix is invertible, which is not checked upon). 
## In fact it returns a list containing functions ("methods") to get,
## and set and matrix, for which the cache is stored and to get and set the
## value of matrix inversion value to be cached.
makeCacheMatrix <- function(x = matrix()) 
{

}

## Given a list created with "makeCacheMatrix", calculates the inverse of 
## the matrix, for which the list was created, and stores this matrix in the 
## cache prepared by "makeCacheMatrix", or - if it was already done for 
## list created with "makeCacheMatrix" - ir retrieves the value from 
## the cache. 
cacheSolve <- function(x, ...) 
{
  ## Return a matrix that is the inverse of 'x'
}
