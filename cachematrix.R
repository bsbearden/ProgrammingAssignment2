## Functions in this file implement a cacheable inverse of a matrix. If the
## inverse has already been calculated, the cached copy will be returned. If
## the inverse has not be calculated, it will be calculated, cached, and
## returned.

## Container to hold the matrix and the inverse. If the matrix changes, the
## stored inverse will be discarded.

makeCacheMatrix <- function(x = matrix()) {
        
        ## intialize inverse to null
        inverse <- NULL
        
        ## store the matrix. Assume it has been changed and discard the cached
        ## copy of the inverse, if any
        setMatrix <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        
        ## return the stored matrix
        getMatrix <- function() x
        
        ## store inverse of the matrix
        setInverse <- function(inv) inverse <<- inv
        
        ## get the stored inverse, if any
        getInverse <- function() inverse
        
        ## return this cache
        list(setMatrix = setMatrix, 
             getMatrix = getMatrix,
             setInverse = setInverse,
             getInverse = getInverse)
}


## Return the inverse of the Matrix. The inverse will only be calculated once
## for any Matrix. After the first call, a cached copy of the inverse will be
## returned.

cacheSolve <- function(cache, ...) {
        ## Get cahced inverse and return if it exists
        inverse <- cache$getInverse()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        
        ## No cached inverse exists. Calcualte the inverse and cache it
        matrix <- cache$getMatrix()
        inverse <- solve(matrix, ...)
        cache$setInverse(inverse)
        
        ## return the newly calculated inverse
        inverse        
}
