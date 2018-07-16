from random import randint
#Lab 9 Warmup 1: Generating Synthetic Test Data
def gendata():
    fname = input('Enter a file name: ')
    fname += '.csv'
    syndata = open(fname,"w")
    for i in range(1,1001):
        syndata.write(str(i)+','+str(randint(-1000,1000))+'\n')
    print('Data Printed to ', fname)
    syndata.close()

#Lab 9 Warmup 2: Processing The Test Data
def procdata():
    filename = input('Enter a file name: ')
    filename += '.csv'
    minim = 1001
    maxim = -1001
    procfile = open(filename, 'r')
    for line in procfile:
        linelst = line.split(',')
        linelst[1] = linelst[1].split('\n')
        linelst[1][0] = int(linelst[1][0])
        if linelst[1][0] < minim:
            minim = linelst[1][0]
        elif linelst[1][0] > maxim:
            maxim = linelst[1][0]
    print(minim,maxim)
    procfile.close()
