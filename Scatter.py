import matplotlib.pyplot as plt
import numpy as np

data = {2:1,3:2,4:3,5:4,6:5}
x = list(data.keys())
y = list(data.values())

plt.plot(x, y, 'o', color='blue');
plt.show()
