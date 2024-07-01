import math
data = {8,12,13,20}

def variance(data):
    n = len(data)
    df = n - 1
    mean = sum(data)/n
    variance = sum([(x - mean)**2 for x in data])/(df)
    return variance
var = variance(data)
print("Variance =",var)

def sigma(data):
    var = variance(data)
    sigma = math.sqrt(var)
    return sigma

print("Standard Deviation =",sigma(data))
