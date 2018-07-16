##L8 Stretch 1: Letter count
def ltrcount(istr):
    lcount = 0
    for i in range(0,len(istr)):
        if istr[i].isalpha():
            lcount += 1
    return lcount

##L8 Stretch 2: Reverse a String
def reverse(istr):
    newstr = ''
    for letter in range(len(istr)-1,-1,-1):
        newstr += istr[letter]
    return newstr

##L8 Strech3:  Palindrome Check
def ispalindrome(istr):
    istr2 = istr.lower()
    for punct in ",.…;: '!?":
        istr2 = istr2.replace(punct,'')
    print(istr2)
    if istr2 == reverse(istr2):
        return True
    else:
        return False
def main():
    cont = True
    while cont:
        instr = input('Enter a string: ')
        if ispalindrome(instr):
            print(instr, 'is a palindrome.')
        else:
            print(instr, 'is not a palindrome.')
        icont = input('Continue (y/n?): ')
        if icont == 'n':
            cont = False
