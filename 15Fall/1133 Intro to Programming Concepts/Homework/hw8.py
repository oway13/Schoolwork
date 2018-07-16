from os import path

def filein():
    #Inputs File Name, Loops 3 Times If File Doesn't Exist
    count = 3
    while count > 0:
        file = input('Input Filename: ')
        if path.isfile(file):
            return file
        else:
            count -= 1
    return False


def filestrip(file):
    #Returns List Containing Each Individual Word And A Lot Of Vestigial Spaces
    fstrip = []
    for line in file:
        fstring = line
        if fstring != '':
            for char in '()[]{}=!<>.,:+-*/\%$':
                fstring = fstring.replace(char, ' ')
            fstring = fstring.strip()
            fstring = fstring.split(' ')
            fstrip += [fstring]
    return fstrip


def keycount(fstring):
    #Checks If Each Item In List Is In The Alphabetically Sorted Keyword List
    #Iterates Counter For Keyword
    keylist =[['and', 0],['as', 0],['assert', 0],['break', 0], \
              ['class', 0],['continue', 0],['def', 0],['del', 0],\
              ['elif', 0],['else', 0],['except', 0],['False', 0], \
              ['finally', 0],['for', 0],['from', 0],['global', 0], \
              ['if', 0],['import', 0],['in', 0],['is', 0], \
              ['lambda', 0],['None', 0],['nonlocal', 0],['not', 0], \
              ['or', 0],['pass', 0],['raise', 0],['return', 0], \
              ['True', 0],['try',0],['while', 0],['with', 0],['yield', 0]]
    for i in range(len(fstring)):
        for n in range(len(fstring[i])):
            if not("'" in fstring[i][n] or '"' in fstring[i][n]):
                for q in range(len(keylist)):
                   if fstring[i][n] == keylist[q][0]:
                       keylist[q][1] += 1
    return keylist


def printkeys(lst):
    #Prints Keywords Whose Counter Values Are Not 0
    print('Keyword frequency in alphabetic order:')
    for i in range(len(lst)):
        if lst[i][1] != 0:
            print(lst[i][0], '\t', lst[i][1])


def main():
    #If 3 Invalid Files, Terminates, OW Runs Other Functions
    file = filein()
    if file == False:
        return
    else:
        pyfile = open(file,'r')
        pystring = filestrip(pyfile)
        keys = keycount(pystring)
        printkeys(keys)
        pyfile.close()
        
main()
