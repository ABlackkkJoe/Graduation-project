from sklearn.cluster import KMeans
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
consume_data=pd.DataFrame(pd.read_csv("./k_means.csv",header=0))
print (consume_data.head())
print (consume_data.columns)

consume = np.array(consume_data[['count','opfare']])
clf=KMeans(n_clusters=2)
clf=clf.fit(consume)
print (clf.cluster_centers_)


consume_data['label']=clf.labels_
print (consume_data.head())

#print (consume_data.loc[consume_data["outid"] == 1414010513 ]['label'])

consume_data0=consume_data.loc[consume_data["label"] == 0]
consume_data1=consume_data.loc[consume_data["label"] == 1]
plt.rc('font', family='STXihei', size=10)
plt.scatter(consume_data0['count'],consume_data0['opfare'],50,color='#0000FE',marker='^',linewidth=2,alpha=0.8)
plt.scatter(consume_data1['count'],consume_data1['opfare'],50,color='#FE0000',marker='*',linewidth=2,alpha=0.8)
#plt.annotate("(%s)" % consume_data0['outid'])
plt.xlabel('count')
plt.ylabel('opfare')
plt.title('k-means consume data')
plt.legend('012')
axis = plt.gca().yaxis
axis.get_ticklocs()
axis.get_ticklabels()
axis.get_ticklines()
axis.get_ticklines(minor = True)
for label in axis.get_ticklabels():
    label.set_color('red')
    label.set_rotation(45)
    label.set_fontsize(12)
for line in axis.get_ticklines():
    line.set_color('green')
    line.set_markersize(15)
    line.set_markeredgewidth(3)

plt.xlim(0,100)
plt.grid(color='#95a5a6',linestyle='--', linewidth=1,axis='both',alpha=0.4)
plt.show()






