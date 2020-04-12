# Data Preprocessing Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:-1].values
y = dataset.iloc[:, -1].values

# Splitting the dataset is not needed due to small dataset
"""from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
"""

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

#Fitting Linear Regression to the dataset
from sklearn.linear_model import LinearRegression
regr = LinearRegression()
regr.fit(X, y)

#Fitting Polynomial Regression to the dataset
from sklearn.preprocessing import PolynomialFeatures
poly_regr = PolynomialFeatures(degree = 4)
X_poly = poly_regr.fit_transform(X)
regr2 = LinearRegression()
regr2.fit(X_poly, y)

#Visualize Linear results
plt.scatter(X, y, color = 'red')
plt.plot(X, regr.predict(X), color = 'blue')
plt.title('Truth or Bluff')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.show()

#Visualize Poly Results
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, y, color = 'red')
plt.plot(X_grid, regr2.predict(poly_regr.fit_transform(X_grid)), color = 'blue')
plt.title('Truth or Bluff')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.show()

#Predict a new result with Linear Regression
regr.predict([[6.5]])

#Predict a new result with Polynomial Regression
regr2.predict(poly_regr.fit_transform([[6.5]]))






