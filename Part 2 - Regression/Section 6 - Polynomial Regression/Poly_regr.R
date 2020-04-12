# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
#library(caTools)
#set.seed(123)
#split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
#training_set = subset(dataset, split == TRUE)
#test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting Linear Regression to the dataset
regr = lm(formula = Salary ~., data = dataset)



#Fitting Polynomial Regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
regr_poly = lm(formula = Salary ~ ., data = dataset)


#Visualizing Linear Regression
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regr, newdata = dataset)),
            color = 'blue') +
  ggtitle('Truth or Bluff(Linear Regression)') +
  xlab('Level') +
  ylab('Salary')


#Visualizing Polynomial Regression

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regr_poly, newdata = dataset)),
            color = 'blue') +
  ggtitle('Truth or Bluff(Poly Regression)') +
  xlab('Level') +
  ylab('Salary')

#Predicting new result with Linear Regression
y_pred = predict(regr, data.frame(Level = 6.5))


#Predicting new result with Polynomial Regression
y_pred = predict(regr_poly, data.frame(Level = 6.5, 
                                       Level2 = 6.5^2,
                                       Level3 = 6.5^3,
                                       Level4 = 6.5^4))
