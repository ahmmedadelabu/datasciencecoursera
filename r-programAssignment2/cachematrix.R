## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#Creates a matrix that can cache it's inverse
# function Args:(x: A matrix (Optional))
# Returns:
#   A matrix with functions to get/set value & get/set inverse

makeCacheMatrix <- function(x = matrix()) {
# cached inverse of matrix
  mat.inv <- NULL
  
  ## set/get for matrix
  get <- function() x
  set <- function(y) {
    x <<- y
    mat.inv <<- NULL
  }
  
  ## set/get for matrix inverse
  getinv <- function() mat.inv
  setinv <- function(inverse) mat.inv <<- inverse
  
  ## return list of functions for matrix
  list(get=get, set=set, getinv=getinv, setinv=setinv)

}


## Write a short comment describing this function
# Computes the inverse of a matrix. If the inverse has already been
# calculated before, the cached inverse is returned.
# fuction Args:(x: A matrix,...: Extra arguments)
# Returns:
#   The inverse of the matrix

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()

  # return cached matrix inverse if it's been already computed
  if (!is.null(inv)) {
    message("inverse is cached")
    return(inv)
  }
  
  # compute inverse of matrix 
  m <- x$get()
  inv <- solve(m, ...)
  
  # cache inverse
  x$setinv(inv)
  
  # return inverse of matrix
  return(inv)

}

m <- matrix(c(19, 2, 5, 8), nrow = 2, ncol = 2, byrow = TRUE)
m2 <- makeCacheMatrix(m)
cacheSolve(m2)

