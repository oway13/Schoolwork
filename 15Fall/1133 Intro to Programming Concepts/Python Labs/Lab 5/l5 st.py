word = ' '
wordlist = []
index = 0
while word != '':
    word = input('Enter a Word (enter nothing to continue): ')
    if word == '':
        for i in range(1,len(wordlist)+1):
            print(wordlist[i-1])
    elif word[0] in word[1:]:
        wordlist += ['']
        wordlist[index] = word
        index += 1


