###Chapter 3 Dummy Coding

###Starting Off
# fs is in Data Camp's workspace
# Summary statistics
describeBy(fs, fs$dept)

###Creating Dummy Variables (1)
# `fs` is available in your working environment

# Create the dummy variables
dept_code <- dummy.code(fs$dept)
dept_code

# Merge the dataset in an extended dataframe
extended_fs <- cbind(dept_code, fs)

# Look at the extended dataframe
extended_fs

# Provide summary statistics
summary(extended_fs)

###Creating Dummy Variables (2)
# `fs` is available in your working environment

# Regress salary against years and publications
model <- lm(fs$salary ~ fs$years + fs$pubs)

# Apply the summary function to get summarized results for model
summary(model)

# Compute the confidence intervals for model
confint(model) 

# Create dummies for the categorical variable fs$dept by using the C() function
dept_code <- C(fs$dept, treatment)

# Regress salary against years, publications and department 
model_dummy <- lm(fs$salary ~ fs$years + fs$pubs + dept_code)

# Apply the summary function to get summarized results for model_dummy
summary(model_dummy)

# Compute the confidence intervals for model_dummy
confint(model_dummy)

###Model Selection: ANOVA
# The dataset `fs` and regressions `model` and `model_dummy` are available in your workspace

# Compare model 4 with model3
anova(model, model_dummy)

###Discrepancy Between Actual and Predicted Means
# `fs` is still available in your working environment

#Actual means of fs$salary
tapply(fs$salary, fs$dept, mean)

###Unweighted Effects Coding
# The dataframe `fs` is still loaded in

# Number of levels
fs$dept

# Factorize the categorical variable fs$dept and name the factorized variable dept.f
dept.f <- factor(fs$dept)

# Assign the 3 levels generated in step 2 to dept.f
contrasts(dept.f) <-contr.sum(3)

# Regress salary against dept.f
model_unweighted <- lm(fs$salary ~ dept.f)

# Apply the summary() function
summary(model_unweighted)

###Weighted Effects Coding
# Factorize the categorical variable fs$dept and name the factorized variable dept.g
dept.g <- factor(fs$dept)

# Assign the weights matrix to dept.g 
contrasts(dept.g) <-weights

# Regress salary against dept.f and apply the summary() function
model_weighted <- lm(fs$salary ~ dept.g)

# Apply the summary() function
summary(model_weighted)


