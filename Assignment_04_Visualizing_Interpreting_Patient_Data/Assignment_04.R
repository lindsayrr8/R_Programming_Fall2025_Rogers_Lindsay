
### Link to relevant blog post: https://rlanguagejournal.blogspot.com/2025/09/module-4-visualizing-and-interpreting.html

# Define vectors converting categorical strings to numeric codes
Frequency     <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
FirstAssess   <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)    # bad=1, good=0
SecondAssess  <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)    # low=0, high=1
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)    # low=0, high=1

df_hosp <- data.frame(
  Frequency, BloodPressure, FirstAssess,
  SecondAssess, FinalDecision, stringsAsFactors = FALSE
)
# Inspect and handle NA's
summary(df_hosp)
df_hosp <- na.omit(df_hosp)


# Generate basic visualizations

boxplot(
  BloodPressure ~ FirstAssess,
  data = df_hosp,
  names = c("Good","Bad"),
  ylab = "Blood Pressure",
  main = "BP by First MD Assessment"
)

boxplot(
  BloodPressure ~ SecondAssess,
  data = df_hosp,
  names = c("Low","High"),
  ylab = "Blood Pressure",
  main = "BP by Second MD Assessment"
)

boxplot(
  BloodPressure ~ FinalDecision,
  data = df_hosp,
  names = c("Low","High"),
  ylab = "Blood Pressure",
  main = "BP by Final Decision"
)



# Visualize overall distributions of Frequency and Blood Pressure

hist(
  df_hosp$Frequency,
  breaks = seq(0, 1, by = 0.1),
  xlab = "Visit Frequency",
  main = "Histogram of Visit Frequency"
)

hist(
  df_hosp$BloodPressure,
  breaks = 8,
  xlab = "Blood Pressure",
  main = "Histogram of Blood Pressure"
)


### Example of a better organized data set


# Create new data frame with example data
df_example <- data.frame(
  PatientID      = c("Patient 1", "Patient 2", "Patient 3"),
  Blood_Pressure = c(80, 100, 180),
  Num_Visits     = c(1, 2, 4),
  stringsAsFactors = FALSE
)

# Inspect
df_example


# Create simple scatterplot
plot(df_example$Num_Visits, df_example$Blood_Pressure,
     xlab = "Number of Visits",
     ylab = "Blood Pressure",
     main = "Blood Pressure vs. Number of Visits",
     pch = 19,         
     col = "blue",
     xaxt = "n")

# Ensure x axis shows only whole number visits
axis(side = 1, at = 1:4)

# Add labels for each point
text(df_example$Num_Visits, df_example$Blood_Pressure, 
     labels = df_example$PatientID, 
     pos = 3, cex = 0.8)

# Use linear regression to add a line to the plot
model <- lm(Blood_Pressure ~ Num_Visits, data = df_example)
abline(model, col = "red", lwd = 2)




