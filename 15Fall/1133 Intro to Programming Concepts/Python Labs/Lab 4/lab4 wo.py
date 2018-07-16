#vars
objects = 21
inpcheck = False
inpcheck2 = False
turn = 0
obrem = 0

while not inpcheck:
    first = str(input('Would you like to go first? (y/n) '))
    if first == 'y':
        inpcheck = True
        turn = 1
    elif first == 'n':
        inpcheck = True
        turn = 2
    else:
        print('Invalid input, choose y or n')
while objects > 0:
    if turn % 2 == 1: #player turn
        inpcheck2 = False
        while not inpcheck2:
            obrem = eval(input(str(objects) + ' objects remain, choose 1, 2, or 3: '))
            if obrem == 1 or obrem == 2 or obrem == 3:
                inpcheck2 = True
            else:
                print('Invalid input, choose 1, 2, or 3')
        objects -= obrem
        turn += 1
    elif turn % 2 == 0: #computer turn
        if (objects - 1) % 4 == 0:
            obrem = 1
        elif (objects - 2) % 4 == 0:
            obrem = 2
        elif (objects - 3) % 4 == 0:
            obrem = 3
        else:
            obrem = 1
        print(objects, "objects remain, I'll take", obrem)
        objects -= obrem
        turn += 1
        
if (turn - 1) % 2 == 1:
    print('You win, thanks for playing')
elif (turn - 1) % 2 == 0:
    print('I win, thanks for playing')
        
    
