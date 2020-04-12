# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('50_Startups.csv')

#encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting multiple linear regression to the training set
regr = lm(formula = Profit ~ ., 
          data = training_set)

#Predicting the test set results
y_pred = predict(regr, newdata = test_set)

#Build optimal model using Backward Elimination
regr = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
          data = dataset)

summary(regr)
#Remove highest P-value and fit data again (State)
regr = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, 
          data = dataset)

summary(regr)
#Remove Admin (SL > P-Value)
regr = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, 
          data = dataset)

summary(regr)
#Remove Marketing
regr = lm(formula = Profit ~ R.D.Spend, 
          data = dataset)

summary(regr)
