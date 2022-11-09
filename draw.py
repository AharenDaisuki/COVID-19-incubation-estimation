from sklearn import linear_model
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.metrics import mean_squared_error as mse
import numpy as np
import math

df=pd.read_csv("insurance.csv")
df=df[df['smoker']=='no']
X=df[['age','bmi']]
Y=df['charges']
regr=linear_model.LinearRegression()
regr.fit(X,Y)
fig = plt.figure()
ax = fig.add_subplot(projection='3d')
ax.scatter(X['age'],X['bmi'],Y)
plt.show()
predict=regr.predict(X)
residual=predict-Y

residual=residual/math.sqrt((mse(Y,predict)))

residual=pd.DataFrame(residual)
fig = plt.figure()
ax = fig.add_subplot(projection='3d')
X=X[(residual['charges']<0.5) & (residual['charges']>-0.5)]
Y=Y[(residual['charges']<0.5) & (residual['charges']>-0.5)]
ax.scatter(X['age'],X['bmi'],Y)
plt.show()
regr.fit(X,Y)
predict=regr.predict(X)
residual=predict-Y
print(residual)

# predict=pd.DataFrame(predict)
# predict=pd.concat([predict,Y,X],axis=1)
# predict.to_csv('predict.csv')

