from sklearn import linear_model
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.metrics import mean_squared_error as mse
from sklearn.metrics import r2_score
from matplotlib import pyplot
import seaborn as sns

import numpy as np
import math
fig = plt.figure()
# pyplot.ion()
# def call_back(event):
#     axtemp=event.inaxes
#     x_min, x_max = axtemp.get_xlim()
#     fanwei = (x_max - x_min) / 10
#     if event.button == 'up':
#         axtemp.set(xlim=(x_min + fanwei, x_max - fanwei))
#         print('up')
#     elif event.button == 'down':
#         axtemp.set(xlim=(x_min - fanwei, x_max + fanwei))
#         print('down')
#     fig.canvas.draw_idle()  # 绘图动作实时反映在图像上
# fig.canvas.mpl_connect('scroll_event', call_back)
# fig.canvas.mpl_connect('button_press_event', call_back)

df=pd.read_csv("insurance.csv")
df1=df[df['smoker']=='no']
df2=df[df['smoker']=='yes']
corr = df.corr()
sns.heatmap(corr, cmap = 'Wistia', annot= True);
print(df1.shape)
print(df2.shape)

X=df[['age','bmi']]
Y=df['charges']
regr=linear_model.LinearRegression()
regr.fit(X,Y)

ax = fig.add_subplot(projection='3d')
ax.scatter(X['age'],X['bmi'],Y)
plt.show()
predict=regr.predict(X)
residual=predict-Y
print(r2_score(Y, predict))# 这里是去掉outlier前的R值

residual=residual/math.sqrt((mse(Y,predict)))

residual=pd.DataFrame(residual)
fig = plt.figure()
ax = fig.add_subplot(projection='3d')
X=X[(residual['charges']<0.5) & (residual['charges']>-0.5)]
Y=Y[(residual['charges']<0.5) & (residual['charges']>-0.5)] # 这两行是去掉outlier的代码
ax.scatter(X['age'],X['bmi'],Y)
plt.show()
res=regr.fit(X,Y)
predict=regr.predict(X)
print(res.coef_)
residual=predict-Y
print(r2_score(Y, predict))# 去掉outlier后的值

# predict=pd.DataFrame(predict)
# predict=pd.concat([predict,Y,X],axis=1)
# predict.to_csv('predict.csv')

