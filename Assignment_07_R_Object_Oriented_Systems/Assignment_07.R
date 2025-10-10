
# Import dataset
data("mtcars")

# View first few rows
head(mtcars)

# View structure
str(mtcars)

# Print first 10 rows of first column (mpg)
print(mtcars[1:10, 1])

# View summary stats for each column
summary(mtcars)

# Plot mtcars mpg vs. weight
plot(mtcars$wt, mtcars$mpg,
     main = "Mileage per Gallon vs. Car Weight",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles per Gallon (mpg)",
     pch = 19,
     col = "blue")

# Add a regression line to the plot
abline(lm(mpg ~ wt, data = mtcars), col = "red", lwd = 2)


##################################################


# Create an S3 object example
s3_obj <- list(name = "Myself", age = 28, GPA = 3.9)
class(s3_obj) <- "student_s3"

# Create an S4 class and object example
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))
s4_obj <- new("student_s4", name = "Myself", age = 28, GPA = 3.9)

# Print statements for each type of object (s3 and s4)
print(s3_obj)
print(s4_obj)

# Check whether object is S3 or S4 using function
isS4(s4_obj)
isS4(s3_obj)

# Multiple options for testing type of object

# Using typeof()
typeof(s3_obj)
typeof(s4_obj)
# Using str()
str(s3_obj)
str(s4_obj)


