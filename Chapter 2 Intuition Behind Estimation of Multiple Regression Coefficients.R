###Chapter 2 Intuition Behind Estimation of Multiple Regression Coefficients

###Definition of Matrices
# Construction of 3 by 8 matrix r that contains the numbers 1 up to 24
r <- matrix(1:24, nrow = 3, ncol = 8)

# Construction of 3 by 8 matrix s that contains the numbers 21 up to 44
s <- matrix(21:44, nrow = 3, ncol = 8)

# Take the transpose t of matrix r
t <- t(r)

###Addition, Subtraction and Multiplication of Matrices
# The matrices r and s are preloaded in your workspace

# Compute the sum of matrices r and s
operation_1 <- r + s

# Compute the difference between matrices r and s
operation_2 <- r - s

# Multiply matrices t and s
operation_3 <- t %*% s

###Row Vector of Sums
# The raw dataframe `X` is in Data Camp's workspace.
X

# Construction of 1 by 10 matrix I of which the elements are all 1
I <- matrix(1, 1, 10)

# Compute the row vector of sums
t_mat <- I %*% X

###Row Vector of Means and Matrix of Means
# The data matrix `X` and the row vector of sums (`t_mat`) are saved and can be used.

# Number of observations
n = 10

# Compute the row vector of means 
M <- t_mat * (1/n)

# Construction of 10 by 1 matrix J of which the elements are all 1
J <- matrix(1, 10, 1)

# Compute the matrix of means 
MM <- J %*% M

###Matrix of Deviation Scores
# The previously generated matrices X, M and MM do not need to be constructed again but are saved and can be used.

# Matrix of deviation scores D 
D <- X - MM

###Sum of Squares and Sum of Cross Products Matrix
# The previously generated matrices X, M, MM and D do not need to be constructed again but are saved and can be used.

# Sum of squares and sum of cross products matrix
S <- t(D) %*% D

###Calculating the Correlation Matrix
# The previously generated matrices X, M, MM, D and S do not need to be constructed again but are saved and can be used.
n = 10

# Construct the variance-covariance matrix 
C <- S * (1/n)

# Generate the standard deviations matrix 
SD <- diag(x = diag(C)^(1/2), nrow = 3, ncol = 3)

# Compute the correlation matrix
R <- solve(SD) %*% C  %*% solve(SD)


