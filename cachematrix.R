## These functions allow to cache the result of matrix inversion in special
## objects by use of R language scoping rules applied with operator "<<-".

## Creates a special "wrapper" object for a matrix stored in memory together 
## with cached value of the matrix inversion, if it was already calculated.
## In fact it returns a list containing functions ("methods") to get,
## and set and matrix, for which the cache is stored and to get and set the
## value of matrix inversion value to be cached.
makeCacheMatrix <- function(mat = matrix()) 
{
  # initialize the cached inverse with null locally
  inv<- NULL
  
  # set the matrix, for which we want to cache the inverse 
  set <- function(y) 
  {
    mat <<- y
    # if setting a new matrix, forget the cached inverse
    inv <<- NULL
  }
  # get the matrix, for which we want to cache the inverse 
  get <- function() 
  {
    mat
  }
  
  # set the cached value of the inverse of the matrix
  set_inverse <- function(new_inverted) 
  {
    inv <<- new_inverted
  }
  # get the cached value of the inverse of the matrix
  get_inverse <- function() 
  {
    inv
  }
  
  # return list of functions ("methods")
  list(set = set, 
       get = get,
       setmean = setmean,
       getmean = getmean)
}

## Given a list created with "makeCacheMatrix", calculates the inverse of 
## the matrix (as long, as the matrix is invertible, which is not checked
## upon), for which the list was created, and stores this matrix in the 
## cache prepared by "makeCacheMatrix", or - if it was already done for 
## list created with "makeCacheMatrix" - ir retrieves the value from 
## the cache.
cacheSolve <- function(cMat, ...) 
{
  # get the cached inverse of the matrix for which 'cMat' was created with
  # "makeCacheMatrix".
  inv <- cMat$get_inverse()
  
  # if the cache was already stored (not null), return it and finish
  if(!is.null(inv)) 
  {
    message("getting cached data")
    return(inv)
  }
  
  # otherwise, the value of the inverse must be first calculated, so...
  # get the  matrix for which 'cMat' was created with "makeCacheMatrix". 
  mat <- cMat$get()
  # invert the matrix with R "solve" (and hope, that 'mat' is square and
  # invertible)
  inv <- solve(mat)
  # store the new value in the cache
  cMat$setmean(inv)
  
  ## Return the value.
  inv
}
