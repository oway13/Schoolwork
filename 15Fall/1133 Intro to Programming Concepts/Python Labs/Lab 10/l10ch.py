#Lab 10 Challenge: Fully Associative Memory Program

def addDB(adict, istr1, istr2):
    if istr1 in adict:
        adict[istr1] += [istr2]
        adict[istr2] = [istr1]
    elif istr2 in adict:
        adict[istr2] += [istr1]
        adict[istr1] = [istr2]
    else:
        adict[istr1] = [istr2]
        adict[istr2] = [istr1]
    return adict

def findDB(adict, istr):
    if istr not in adict:
        return []
    else:
        return adict[istr]
    
def removeDB(adict, istr1, istr2):
    if istr1 in adict and istr1 in adict[istr2]:
        del adict[istr1][adict[istr1].index(istr2)]
        del adict[istr2][adict[istr2].index(istr1)]
        if adict[istr1] == []:
            del adict[istr1]
        if adict[istr2] == []:
            del adict[istr2]
    return adict        

##def test():

##    diction = {}
##    diction = addDB(diction, 'bob', '755.3632')
##    diction = addDB(diction, 'carol', '612.4435')
##    diction = addDB(diction, 'sue', '755.3632')
##    diction = addDB(diction, 'bob', '787.3345')
##    print(diction)
##    print(findDB(diction, 'bob'))
##    print(findDB(diction, '755.3632'))
##    print(findDB(diction, 'stan'))
##    diction = removeDB(diction, 'bob', '755.3632')
##    print(diction)

def main():
    end = False
    idict = {}
    while not end:
        command = input('Enter Command: ').split(' ')
        if command[0] == 'add':
            if len(command) == 3:
                idict = addDB(idict, command[1], command[2])
            else:
                print('Invalid # of Inputs, "add" needs 2 values')
        elif command[0] == 'find':
            if len(command) == 2:
                print(findDB(idict, command[1]))
            else:
                print('Invalid # of Inputs, "find" needs 1 value')
        elif command[0] == 'del':
            if len(command) == 3:
                idict = removeDB(idict, command[1], command[2])
            else:
                print('Invalid # of Inputs, "del" needs 2 values')
        elif command[0] == 'clear':
            idict = {}
        elif command[0] == 'end':
            end = True
        else:
            print('Command Not Recognized, Choose from add, find, del, clear, end')









                
                    
