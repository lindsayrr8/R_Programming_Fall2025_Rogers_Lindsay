
# Choose file interactively
# student6 <- read.table(file.choose(), header = TRUE, stringsAsFactors = FALSE)
# View
# student6

### ^ Data has loaded in as a single column instead of separate columns

### Using read.csv() instead is the correct way to import a file in this format and would have prevented this issue

# Using read.csv() instead
student6 <- read.csv(file.choose())

# Check result
student6

# Load plyr and compute the mean of Grade by Sex
  library(plyr)
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

# View result
gender_mean

# Write the grouped means to a text file
  write.table(
    gender_mean,
    file = "gender_mean.txt",
    sep  = "\t",
    row.names = FALSE
  )
  
# Filter names containing “i”
  i_students <- subset(
    student6,
    grepl("i", Name, ignore.case = TRUE)
  )

  # view result
  i_students
  
# Extract just the names and write them to a CSV
  write.csv(
    i_students$Name,
    file      = "i_students.csv",
    row.names = FALSE,
    quote     = FALSE
  )
  
# Save the full filtered data frame to a CSV
  write.csv(
    i_students,
    file      = "i_students_full.csv",
    row.names = FALSE
  )

# Confirm the files gender_mean.txt, i_students.csv, and i_students_full.csv exist in your working directory
  getwd()
  
# Check whether each file exists in the working directory
file.exists("gender_mean.txt", "i_students.csv", "i_students_full.csv")

