import os

data = []
for line in open("./k_means.txt", "r").readlines():
    line = line.rstrip()
    result = ' '.join(line.split())
    s = [int(x) for x in result.strip().split(' ')]
    #print s
    data.append(s)

print data
print (len(data))
L1 = [n[1] for n in data]
#print L0
L2 = [n[2] for n in data]
#print L1

T = dict(zip(L1,L2))
print (T)
print (len(T))

X = list(map(lambda x,y: (x,y), T.keys(),T.values()))
print X
print (len(X))


from sklearn.cluster import Birch
from sklearn.cluster import KMeans

clf = KMeans(n_clusters=3)
y_pred = clf.fit_predict(X)
print(clf)
print(y_pred)

import numpy as np
import matplotlib.pyplot as plt
x = [n[0] for n in X]
#print x
y = [n[1] for n in X]
#print y
x1 = []
y1 = []

x2 = []
y2 = []

x3 = []
y3 = []
i = 0
while i < len(X):
    if y_pred[i] == 0:
        x1.append(X[i][0])
        y1.append(X[i][1])
    elif y_pred[i] == 1:
        x2.append(X[i][0])
        y2.append(X[i][1])
    elif y_pred[i] == 2:
        x3.append(X[i][0])
        y3.append(X[i][1])

    i = i + 1

plot1, = plt.plot(x1, y1, 'or', marker="x")
plot2, = plt.plot(x2, y2, 'og', marker="o")
plot3, = plt.plot(x3, y3, 'ob', marker="*")

plt.title("Kmeans-Consume Data")
plt.xlabel("outid")
plt.ylabel("opfare")

plt.legend((plot1, plot2, plot3), ('A', 'B', 'C'), fontsize=10)

plt.show()