def rlEncode(lst):
    newlst = [lst[0],1]
    n = 0
    for i in range(1,len(lst)):
        if lst[i] == newlst[n]:
            newlst[n+1] += 1
        else:
            newlst += [lst[i], 1]
            n += 2
    return newlst
    

def unitTest():
    ilst = [1,1,1,1,1,3,3,5,5,5,5,5,5,6,8,8,1,1,1,5,5,5,5,13,14,14]
    print('Input List:', ilst)
    print('Compressed List:', rlEncode(ilst))

unitTest()
