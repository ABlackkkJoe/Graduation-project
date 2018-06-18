import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score


plt.subplot(3, 2, 1)

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


x1 = np.array(L1)
x2 = np.array(L2)
# X = np.array([x1,x2])
X = np.array(list(zip(x1, x2))).reshape(len(x1), 2)


plt.xlim([0, 60])
plt.ylim([0, 2000])
plt.title('Instance')
plt.scatter(x1, x2)

colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k', 'b']
markers = ['o', 's', 'D', 'v', '^', 'p', '*', '+']

clusters = [2, 3, 4, 5, 8]
subplot_counter = 1
sc_scores = []
for t in clusters:
    subplot_counter += 1
    plt.subplot(3, 2, subplot_counter)
    kmeans_model = KMeans(n_clusters=t).fit(X)
    for i, l in enumerate(kmeans_model.labels_):
        plt.plot(x1[i], x2[i], color=colors[l], marker=markers[l], ls='None')
    plt.xlim([0, 60])
    plt.ylim([0, 2000])
    sc_score = silhouette_score(X, kmeans_model.labels_, metric='euclidean')
    sc_scores.append(sc_score)
    #silhouette coefficient
    plt.title('K=%s, sc=%0.03f' % (t, sc_score))
plt.figure()
plt.plot(clusters, sc_scores, '*-')
plt.xlabel('Number of Clusters')
#Silhouette Coefficient Score
plt.ylabel('SCScore')
plt.show()