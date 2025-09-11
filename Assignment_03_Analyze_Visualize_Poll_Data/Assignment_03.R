
library(ggplot2)

# Define and inspect data
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll   <- c(  4,      62,      51,    21,      2,        14,       15)
CBS_poll   <- c( 12,      75,      43,    19,      1,        21,       19)

# Combine into data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect
str(df_polls)
head(df_polls, 10)

# Compute mean, median, range for each poll
mean(df_polls$ABC_poll)
median(df_polls$CBS_poll)
range(df_polls[, c("ABC_poll","CBS_poll")])

# Add a column for the difference between CBS and ABC
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

# View result
df_polls



# Bar chart for ABC
ggplot(df_polls, aes(x = Name, y = ABC_poll, fill = Name)) +
  geom_bar(stat = "identity") +
  labs(
    title = "ABC Poll Results by Candidate",
    x = "Candidate",
    y = "ABC Poll"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )



# Bar chart for CBS
ggplot(df_polls, aes(x = Name, y = CBS_poll, fill = Name)) +
  geom_bar(stat = "identity") +
  labs(
    title = "CBS Poll Results by Candidate",
    x = "Candidate",
    y = "CBS Poll"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )



# Create new df with separate entries for each polling network per candidate name
df_expanded <- data.frame(
  Name = rep(df_polls$Name, times = 2),
  Poll = rep(c("ABC_poll", "CBS_poll"), each = nrow(df_polls)),
  Value = c(df_polls$ABC_poll, df_polls$CBS_poll)
)

# Create combined bar chart with transparent overlap
ggplot(df_expanded, aes(x = Name, y = Value, fill = Poll)) +
  geom_bar(stat = "identity", position = "identity", alpha = 0.4) +
  scale_fill_manual(values = c("ABC_poll" = "steelblue",
                               "CBS_poll" = "orange")) +
  labs(
    title = "ABC vs CBS Poll Results by Candidate",
    x = "Candidate",
    y = "Poll Value",
    fill = "Poll"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Visually compare both dataframes
df_polls
df_expanded

