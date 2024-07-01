import matplotlib.pyplot as plt

random.seed(3)
nomral = list(random.normal(loc=0, scale=10, size=1200))

sns.distplot(nomral, kde=Flase, color='blue')
plt.title('Nomral Curve')
plt.xlabel('Values')
plt.ylabel('Frequency')
plt.show()
