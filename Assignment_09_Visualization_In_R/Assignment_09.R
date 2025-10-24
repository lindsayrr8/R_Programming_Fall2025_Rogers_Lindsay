
# Get data set
install.packages("stevedata")

library(stevedata)
library(lattice)
library(ggplot2)


# Import data set
data("turnips", package = "stevedata")
# View
head(turnips)
# Check format of data
str(turnips)

# Add some more groups of variables for analysis

# Create a month category
turnips$month <- format(turnips$date, "%b")
# Order month chronologically
turnips$month <- factor(turnips$month,
                        levels = c("Jan","Feb","Mar","Apr","May","Jun",
                                   "Jul","Aug","Sep","Oct","Nov","Dec"),
                        ordered = TRUE)
# Create a weekday category
turnips$weekday <- weekdays(turnips$date)
# Order weekday chronologically
turnips$weekday <- factor(turnips$weekday,
                          levels = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"),
                          ordered = TRUE)

# View new columns
head(turnips)



### 1. Create two plots using base R functions


# Histogram of distribution of turnip prices
hist(turnips$price,
     main = "Distribution of Turnip Prices",
     xlab = "Price (Bells)",
     col = "mediumblue",
     border = "white")


# Compute average prices for each weekday
avg_price_weekday <- aggregate(price ~ weekday, data = turnips, FUN = mean)

# Bar plot of average turnip prices per weekday
barplot(avg_price_weekday$price,
        names.arg = avg_price_weekday$weekday,
        main = "Average Turnip Prices by Weekday",
        xlab = "Weekday",
        ylab = "Average Price (Bells)",
        col = "lightgreen",
        border = "white")
# Add grid lines
grid(nx = NA, ny = NULL)



### 2. Create two plots using lattice


# Conditional scatter plot of price by date, conditioned by weekday
xyplot(price ~ date | factor(weekday),
       data = turnips,
       main = "Turnip Prices by Date and Weekday",
       xlab = "Date",
       ylab = "Price (Bells)",
       pch = 16,
       col = "orange2")


# Box plot of price by month
bwplot(price ~ factor(month),
data = turnips,
main = "Turnip Prices by Month",
xlab = "Month",
ylab = "Price (Bells)",
col = "lightblue")



### 3. Create two plots using ggplot2


# Jittered scatter plot of turnip prices by weekday and time
ggplot(turnips, aes(x = weekday, y = price, color = time)) +
  geom_jitter(width = 0.2, height = 0, alpha = 0.6) +
  labs(title = "Turnip Prices by Weekday and Time",
       x = "Weekday",
       y = "Price (Bells)",
       color = "Time of Day") +
  theme_minimal()


# Compute average price by weekday and time
avg_prices <- aggregate(price ~ weekday + time, data = turnips, FUN = mean)

ggplot(avg_prices, aes(x = weekday, y = price, group = time, color = time)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(title = "Average Turnip Prices by Weekday and Time",
       x = "Weekday",
       y = "Average Price (Bells)",
       color = "Time of Day") +
  theme_minimal()


