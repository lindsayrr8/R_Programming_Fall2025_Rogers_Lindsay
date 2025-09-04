
# Use the vector
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

# Consider the function
myMean <- function(assignment2) {
  return(sum(assignment) / length(someData))
}

# Call the function
myMean(assignment2)


### Gives error message: object 'assignment' not found

### Issue 1: 'assignment' != 'assignment2'; 'assignment' is undefined

### Issue 2: 'someData' is also undefined; should take 'assignment2'


# Fix the function
myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}

# Call the function
myMean(assignment2)


