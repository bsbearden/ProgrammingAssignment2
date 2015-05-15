
matrix <- matrix(c(2,8,4,9,2,4,3,7,11,9,1,6,4,6,3,2),
                 nrow = 4,
                 ncol = 4)
        
matrix

cache <- makeCacheMatrix()

cache$getMatrix()

cache$setMatrix(matrix)

cache$getMatrix()

inverse <- cacheSolve(cache)

inverse

cache$getInverse()

cache$setMatrix(matrix)

cache$getInverse()
