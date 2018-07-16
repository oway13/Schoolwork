import random
#hand counts
scount = 0
ecount = 0
ncount = 0
tycount = 0
tocount = 0
natcount = 0
bustcount = 0
deck = []
hand = []


for i in range(1,10001):
    stand = False
    index = 0
    while not stand:
        if len(deck) == 0:
            deck = 4*[2,3,4,5,6,7,8,9,10,10,10,10,11]
            random.shuffle(deck)
        draw = random.randint(1,52)
        hand += ['']
        hand = deck[draw-1]
        hvalue = 0
        del(deck[draw-1])
        for n in range(1,len(hand)+1):
            if hand[n-1] <= 10 and hand[n-1] >= 2:
                hvalue += hand[n-1]
            elif hand[n-1]== 11 and (value + 11) < 21:
                hvalue += 11
            elif hand[n-1]==11(value + 1) < 21:
                hvalue += 1
            elif hand[n-1]== 11 and abs((21- value+1)) < abs(21-(value+11)):
                hvalue += 1
            else:
                hvalue += 11
            if hvalue == 17:
                scount += 1
                stand = True
            elif hvalue == 18:
                ecount += 1
                stand = True
            elif hvalue == 19:
                ncount += 1
                stand = True
            elif hvalue == 20:
                tycount += 1
                stand = True
            elif hvalue == 21 and len(hand) == 2:
                natcount += 1
                stand == True
            elif havlue == 21:
                tocount += 1
                stand = True
            elif hvalue > 21:
                bustcount += 1
                stand = True
        index += 1
print('Seventeen: ', scount)
print('Eighteen: ', ecount)
print('Nineteen: ', ncount)
print('Twenty: ', tycount)
print('Natural Twenty-One: ', natcount)
print('Twenty-One: ', tocount)
print('Bust Count: ', bustcount)
        
    

