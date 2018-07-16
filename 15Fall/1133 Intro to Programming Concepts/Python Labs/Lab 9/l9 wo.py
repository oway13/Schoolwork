#Lab 9 Workout: Earthquake Data
def getkey(item):
    return item[0]

eqfile = open('2.5_day.csv','r')

line = eqfile.readline()
line = line.strip().split(',')
for i in range(len(line)):
   print(i, '\t', line[i])

linelst = []
for cline in eqfile:
    cline = cline.strip().split(',')
    linelst += [[float(cline[4]),cline[14].replace('"','')]]
linelst = sorted(linelst, key=getkey, reverse = True)
for i in range(len(linelst)):
    print(linelst[i][0], linelst[i][1])

eqfile.close()
