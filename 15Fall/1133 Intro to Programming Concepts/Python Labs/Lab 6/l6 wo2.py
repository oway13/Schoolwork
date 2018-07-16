def rootN(n,root):
    curroot = (n/2)
    while abs((curroot**root)-n) >= 0.0001:
        curroot = (1/root)*(((root-1)*curroot)+(n/(curroot**(root-1))))
    print(curroot)
cont = True
while cont:
    inp = input('Enter Value and Root: ')
    ind = 0
    numb = ''
    root = ''
    while inp[ind] != ' ':
        numb += inp[ind]
        ind += 1
    while ind < len(inp):
        root += inp[ind]
        ind += 1
    print('Value: ', numb, 'Root: ', root)
    rootN(float(numb), int(root))

    valcont = False
    while not valcont:
        conts = input('continue? (y/n): ')
        if conts == 'y':
            cont = True
            valcont = True
        elif conts == 'n':
            valcont = True
            cont = False
        else:
            print('Invalid Input')
            valcont = False
            
    
