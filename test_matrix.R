
# create test matrix
matriz <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)

# create special matrix, based on the original one
matriz_especial<-makeCacheMatrix(matriz)

# calculate the inverse
inversa <- cacheSolve(matriz)

## in the first execution it should provide the following results:
# > matriz_especial<-makeCacheMatrix(matriz)
# > inversa
# [,1] [,2]
# [1,] -2.5    2
# [2,]  1.5   -1

## in the second execution it should provide the reuslts
# > inversa <- cacheSolve(matriz_especial)
# getting cached data (inverse)
# > inversa
# [,1] [,2]
# [1,] -2.5    2
# [2,]  1.5   -1