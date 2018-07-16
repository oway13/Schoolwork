#Lab 9 Stretch: Letter Frequencies
tfile = open('asttechnical.txt', 'r')

ltrlst = []
for ltr in range(26):
    ltrlst += [[chr(ltr+97), 0]]

for line in tfile:
    for n in range(len(line)):
        for x in range(len(ltrlst)):
            if line[n] == ltrlst[x][0]:
                ltrlst[x][1] += 1   
print(ltrlst)
tfile.close()
