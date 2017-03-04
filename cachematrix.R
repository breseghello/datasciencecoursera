# The two functions below work together to save computing time in case of 
# repeatedly needing invert the same matrix within a routine.

# makeCacheMatrix creates a list of four functions:
# function set: sets the value of the matrix
# function get: gets the value of the matrix
# function setinverse: sets the value of inverse of the matrix
# function getinverse: gets the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
            x <<- y
            inv <<- NULL
      }
      get <- function() x
      setinverse <- function(inverse) inv <<- inverse
      getinverse <- function() inv
      list(set=set, get=get, 
           setinverse=setinverse, 
           getinverse=getinverse)
}


# The following function checks if the inverse has already been computed. 
# If so, it gets the result from cache and skips computation. 
# If not, it computes the inverse and sets the value in the cache 
# via setinverse function.

cacheSolve <- function(x, ...) {
      inv <- x$getinverse()
      if(!is.null(inv)) {
            message("getting cached data.")
            return(inv)
      }
      data <- x$get()
      inv <- solve(data)
      x$setinverse(inv)
      inv
}
