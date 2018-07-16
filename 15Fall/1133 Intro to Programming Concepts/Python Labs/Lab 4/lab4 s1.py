import random
within = 0
total = 1000000
n = 0
while n <= total:
    x = random.random()
    y = random.random()
    point = (x*x)+(y*y)
    if point < 1:
        within += 1
    n += 1
pi = (within/total)*4
print(pi)
