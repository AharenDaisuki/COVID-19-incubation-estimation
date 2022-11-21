import pandas as pd
import matplotlib.pyplot as plt

df=pd.read_csv("insurance.csv")
# df1=df[df['smoker']=='no']
# # df1=df1[df1['sex']=='female']
# Xno=df1['age']
# Yno=df1['charges']
#
fig = plt.figure()
ax = fig.add_subplot()
# ax.scatter(Xno,Yno,color='r')
#
df2=df[df['smoker']=='yes']
Xyes=df2['age']
Yyes=df2['charges']
ax.scatter(Xyes,Yyes,color='b')

plt.show()


