#Lab 10 Warmup

def makeDictionary():
    names = ['joe', 'tom', 'barb', 'sue', 'sally']
    scores = [10,23,13,18,12]
    scoreDict = {}
    for i in range(len(names)):
        scoreDict[names[i]] = scores[i]
    return scoreDict

scoreDict = makeDictionary()
    
def getScore(name, diction):
    if name in diction:
        return diction[name]
    else:
        return -1

print(getScore(input('name: '),scoreDict))
