import random
rescounter = [0,0,0,0,0,0,0,0,0,0,0]
for i in range(1,10001):
    num = random.randint(1,6)+random.randint(1,6)-2
    rescounter[num] += 1
for i in range(2,13):
    print(format(i, ' 6'), end='')
print('')
for i in range(1,12):
    print(format(rescounter[i-1], ' 6'), end='')
