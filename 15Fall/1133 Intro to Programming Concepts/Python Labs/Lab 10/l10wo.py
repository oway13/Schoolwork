#Lab 10 Workout: Counting Keywords
def keyword(file):
    keydict = {'False':0, 'class':0, 'finally':0, 'is':0, 'return':0, \
               'None':0, 'continue':0, 'for':0, 'lambda':0, 'try':0, \
               'True':0, 'def':0, 'from':0, 'nonlocal':0, 'while':0, \
               'and':0, 'del':0, 'global':0, 'not':0, 'with':0, \
               'as':0, 'elif':0, 'if':0, 'or':0, 'yield':0, 'assert':0, \
               'else':0, 'import':0, 'pass':0, 'break':0, 'except':0, \
               'in':0, 'raise':0}
    keylist = []
    pyfile = open(file, 'r')
    for line in pyfile:
        lstr = line.strip().split(' ')
        for i in range(len(lstr)):
            if lstr[i] in keydict:
                keydict[lstr[i]] += 1
    for key in keydict:
        if keydict[key] != 0:
            keylist += [[key.lower(), keydict[key]]]
    keylist = sorted(keylist)
    for i in range(len(keylist)):
        print(keylist[i][0], '\t', keylist[i][1])    
    pyfile.close()


keyword(input('File name: '))
