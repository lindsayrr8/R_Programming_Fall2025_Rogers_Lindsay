
# Define matrices
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# View matrices
A
B

# Compute A + B
A_plus_B <- A + B
# View
A_plus_B

# Compute A - B
A_minus_B <- A - B
# View
A_minus_B

# Build 4x4 matrix
D <- diag(c(4, 1, 2, 3))

# View
D

# Build 5x5 matrix
E <- matrix(0, nrow = 5, ncol = 5)
# Put 3 on the diagonal
diag(E) <- 3
# Set first row as 3, 1, 1, 1, 1
E[1, ] <- c(3, 1, 1, 1, 1)
# Set first column as 3, 2, 2, 2, 2
E[, 1] <- c(3, 2, 2, 2, 2) 

# View result
E
