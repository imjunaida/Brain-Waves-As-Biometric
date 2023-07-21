# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Dataset.csv')
X = dataset.iloc[:,:-1].values
y = dataset.iloc[:, 8].values

"""for i in range(603):
    X[i][2]=(X[i][2]+X[i][3])/2
    X[i][4]=(X[i][4]+X[i][5])/2
    X[i][6]=(X[i][6]+X[i][7])/2"""
#X = dataset.iloc[:,[0,1,2,4,6]].values
#encoding data
from sklearn.preprocessing import LabelEncoder,OneHotEncoder
#encoding categorical features
labelencoder_y= LabelEncoder()
y=labelencoder_y.fit_transform(y)


# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.25, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)


# Fitting Random Forest Classification to the Training set
from sklearn.ensemble import RandomForestClassifier
classifier = RandomForestClassifier(n_estimators = 11, criterion = 'entropy', random_state = 0)
classifier.fit(X_train, y_train)
# Predicting the Test set results
y_pred = classifier.predict(X_test)
a=0
b=0
for i in range(0,151):
     b=b+1
     if y_pred[i]==y_test[i]:
         a=a+1
accuracy=(a/b)*100
     
# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)

plt.show()
