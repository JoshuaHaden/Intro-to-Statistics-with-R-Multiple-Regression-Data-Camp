###Chapter 1 A Gentle Introduction to the Principles of Multiple Regression

###Multiple Regression: Visualization of the Relationships
# fs is available in Data Camp's workspace

# Perform the two single regressions and save them in a variable
model_years <- lm(fs$salary ~ fs$years)
model_pubs <- lm(fs$salary ~ fs$pubs)

# Plot both enhanced scatter plots in one plot matrix of 1 by 2
par(mfrow = c(1, 2))
plot(fs$salary ~ fs$years, main = "plot_years", xlab = "years", ylab = "salary")
abline(model_years)
plot(fs$salary ~ fs$pubs, main = "plot_pubs", xlab = "pubs", ylab = "salary")
abline(model_pubs)

###Multiple Regression: Model Selection
# fs is available in your working environment

# Do a single regression of salary onto years of experience and check the output
model_1 <- lm(fs$salary ~ fs$years)
summary(model_1)

# Do a multiple regression of salary onto years of experience and numbers of publications and check the output
model_2 <- lm(fs$salary ~ fs$years + fs$pubs)
summary(model_2)

# Save the R squared of both models in preliminary variables
preliminary_model_1 <- summary(model_1)$r.squared
preliminary_model_2 <- summary(model_2)$r.squared

# Round them off while you save them in a vector
r_squared <- c()
r_squared[1] <- round(preliminary_model_1,3)
r_squared[2] <- round(preliminary_model_2,3)

# Print out the vector to see both R squared coefficients
r_squared

###Multiple Regression: Beware of Redundancy
# fs is available in your working environment, just like the variables model_1, model_2 and r_squared that you created in the previous exercise

# Do multiple regression and check out the regression output
model_3 <- lm(fs$salary ~ fs$years + fs$pubs + fs$age)
summary(model_3)

# Round off the R squared coefficients and save the result in the same vector from the previous exercise. do this in one command line this time. 
r_squared[3] <- round(summary(model_3)$r.squared,3)

# Print out the vector in order to display all R squared coefficients simultaneously
r_squared

