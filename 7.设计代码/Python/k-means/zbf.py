import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from scipy.spatial.distance import cdist

import sys

reload(sys)
sys.setdefaultencoding('utf-8')

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


x = np.array(L1)
y = np.array(L2)
# X = np.array([x1,x2])

data = np.array(list(zip(x, y)))

aa=[]
K = range(1, 8)
for k in range(1,8):
    kmeans=KMeans(n_clusters=k) 
    kmeans.fit(data) 
    aa.append(sum(np.min(cdist(data, kmeans.cluster_centers_, 'euclidean'),axis=1))/data.shape[0]) 
plt.figure()
plt.xlabel('k')
plt.ylabel('SSE')
plt.plot(np.array(K), aa, 'bx-') 
plt.show()
''''
plt.figure()
plt.axis([0, 60, 0, 2000])
plt.grid(True)
plt.plot(x, y, 'k.')
kmeans = KMeans(n_clusters=3)
kmeans.fit(data)
plt.plot(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], 'r.')
plt.show()
'''''