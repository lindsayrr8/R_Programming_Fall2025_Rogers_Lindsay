
# Example of buggy code

# Function that flags rows of a numeric matrix 'x' that are outliers for every column according to Tukey rule
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}


# The problem with this function is in "&&" because R expects a single operand but gets arguments greater than 1.
# Instead, "&" should be used because it will compare each element separately and logically 1 by 1.



# 1. Reproduce the error
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
tukey_multiple(test_mat)


# 2. Diagnose the bug

# This gives an error due to the use of "&&" in the tukey_multiple function. This operator expects a TRUE/FALSE value of length 1, but receives a vector of length 10.
# Therefore, it is an improperly suited operator for this task. Instead, we should use "&" for a single-element wise comparison.

# The basic explanation is: "&&" tries to combine a whole matrix column of multiple TRUE/FALSE values into one TRUE/FALSE value.
# The "&" operator would combine each matrix row's TRUE/FALSE pair separately, which is what we want to do.



# 3. Fix the code

# Gives an error for missing "tukey.outlier" function, which is undefined (was not provided in assignment code.)

# Defining the function for testing purposes
tukey.outlier <- function(x) {
  # Dummy stand-in value gives "FALSE" as if no values are outliers
  rep(FALSE, length(x))
}

# Fixed main function with "&" operator
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    # Corrected code inside the loop
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}



# 4. Validate the fix
corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

corrected_tukey(test_mat)



