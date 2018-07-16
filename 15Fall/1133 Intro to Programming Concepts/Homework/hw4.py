import random
cval = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
csuit = ['C','S','D','H']
natflush = 0
tries = 10000 #Easily Changed Number of Attempts

for i in range(1,tries+1):
    #Vars Defined In-Loop
    deck = []
    hand = ['','','','','']
    ccount = 0
    scount = 0
    dcount = 0
    hcount = 0

    #Deck Building
    for value in range(0,len(cval)):
        for suit in range(0,len(csuit)):
            deck += [cval[value]+csuit[suit]]
    random.shuffle(deck)
    
    #Dealing
    for deal in range(0,5):
        hand[deal] = deck[deal]

    #Suit Counting
    for card in range(0,5):
        if 'C' in hand[card]:
            ccount += 1
        elif 'S' in hand[card]:
            scount += 1
        elif 'D' in hand[card]:
            dcount += 1
        elif 'H' in hand[card]:
            hcount += 1

    #Flush Counting
    if ccount == 5 or scount == 5 or dcount == 5 or hcount == 5:
        natflush += 1

#End Results   
print('Number of Natural Flushes in', tries, 'attempts:', natflush)
print('Percentage:', format((natflush/tries)*100, '3.2f'), end='')
print('%')

