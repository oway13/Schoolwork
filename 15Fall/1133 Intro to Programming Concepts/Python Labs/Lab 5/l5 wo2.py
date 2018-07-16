hand = input('Enter hand (2-9,T,J,Q,K,A): ')
value = 0
acecount = 0
for i in range(1,len(hand)+1):
    if hand[i-1] in '23456789':
        value += int(hand[i-1])
    elif hand[i-1] in 'TJQK':
        value += 10
    elif hand[i-1] == 'A':
        acecount += 1
for a in range(1,acecount+1):
        if (value + 11) < 21:
            value += 11
        elif(value + 1) < 21:
            value += 1
        elif abs((21- value+1)) < abs(21-(value+11)):
            value += 1
        else:
            value += 11
print(value)
