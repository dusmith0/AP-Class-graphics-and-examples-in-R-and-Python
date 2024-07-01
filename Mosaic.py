import matplotlib.pyplot as plt
from statsmodels.graphics.mosaicplot import mosaic

props={}
props[('Male','TickTock')]={'facecolor':'brown','edgecolor':'brown'}
props[('Male','Instagram')]={'facecolor':'purple','edgecolor':'purple'}
props[('Male','SnapChat')]={'facecolor':'yellow','edgecolor':'yellow'}
props[('Male','Twitter')]={'facecolor':'blue','edgecolor':'blue'}
props[('Male','Pinterest')]={'facecolor':'red','edgecolor':'red'}


props[('Female','TikTock')]={'facecolor':'brown','edgecolor':'brown'}
props[('Female','Instagram')]={'facecolor':'purple','edgecolor':'purple'}
props[('Female','SnapChat')]={'facecolor':'yellow','edgecolor':'yellow'}
props[('Female','Twitter')]={'facecolor':'blue','edgecolor':'blue'}
props[('Female','Pinterest')]={'facecolor':'red','edgecolor':'red'}


data = {('Male','TikTock'):8,
        ('Male','Instagram'):11,
        ('Male','SnapChat'):12,
        ('Male','Twitter'):10,
        ('Male','Pinterest'):1,
        ('Female','TikTock'):9,
        ('Female','Instagram'):9,
        ('Female','SnapChat'):9,
        ('Female','Twitter'):3,
        ('Female','Pinterest'):8}

mosaic(data, title='Social Media', properties=props)
plt.show()
