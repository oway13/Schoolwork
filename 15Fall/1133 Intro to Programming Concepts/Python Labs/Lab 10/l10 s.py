#Lab 10 Stretch: Morse Code
def morseCode():
    dotdash = {'a':'. _', 'b':'_ . . .', 'c':'_ . _ .', 'd':'_ . .', \
               'e':'.', 'f':'. . _ .', 'g':'_ _ .', 'h':'. . . .', \
               'i':'. .', 'j':'. _ _ _', 'k':'_ . _', 'l':'. _ . .', \
               'm':'_ _', 'n':'_ .', 'o':'_ _ _', 'p':'. _ _ .', \
               'q':'_ _ . _', 'r':'. _ .', 's':'. . .', 't':'_', \
               'u':'. . _', 'v':'. . . _', 'w':'. _ _', 'x':'_ . . _', \
               'y':'_ . _ _', 'z':'_ _ . .'}
    phrase = input('Enter a phrase:').lower()
    for i in range(len(phrase)):   
        if (phrase[i] == ' ' or phrase[i] == '.') and i+1 != len(phrase):
            print(' ')            
        elif phrase[i] in dotdash:
            print(dotdash[phrase[i]])
