import matplotlib.pyplot as plt

data = {'50-59':6,'60-69':7,'70-79':17,'80-89':3}
dates = list(data.keys())
values = list(data.values())

fig = plt.figure(figsize = (10, 5))

plt.bar(dates,values,color = 'blue',width = 0.4)

plt.xlabel("Calc. Score")
plt.ylabel("How many")
plt.title("Score")
plt.show()
