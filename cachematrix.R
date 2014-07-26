## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function sets up a caching area for a matrix and its inverse
## x is the matrix
## invm is the inverse
makeCacheMatrix <- function(x = matrix()) {
  
  invm <- NULL
  set <- function(inp){
    x<<-inp
    invm <<- NULL
    
  }
  get <- function() x
  setinverse <- function(myinv)invm<<-myinv
  getinverse <- function()invm
  list( set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function
## Finds inverse using solve method
## Input to this function is of the form cacheSolve(a) where a<-makeCacheMatrix(somematrix)
## If the inverse is already calculated then return cached value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of a given matrix
        ## 
         a<-x$getinverse()
        if (!is.null(a)){ 
          message("Cached Matrix")
          return(a)        
        }
        outp<-solve(x$get())
        x$setinverse(outp)
        outp
}
