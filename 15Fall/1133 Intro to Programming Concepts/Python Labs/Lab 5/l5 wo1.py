import random
length = int(input('Enter Length of # List: '))
numlist = []
for n in range(1, length+1):
    numlist += [random.randint(1,9)]
print(numlist)
for n in range(1, length+1):
    swapvar = numlist[n-1]
    for i in range(n, length+1):
        if numlist[i-1] == min(numlist[n-1:]):
            numlist[n-1] = numlist[i-1]
            numlist[i-1] = swapvar
print(numlist)

