month = int(input('Enter Month: '))
day = int(input('Enter Day: '))
year = int(input('Enter Year: '))

if month == 1 or month == 3 or month == 5 or month == 7 or month == 8 or month == 10:
    if day == 31:
        month = month + 1
        day = 1
    elif day < 31 and day > 0:
        day = day + 1
    else:
        print ('Invalid date entered')
elif month == 2:
    if year%4 == 0:
        if day == 29:
            month = month + 1
            day = 1
        elif day < 29 and day > 0:
            day = day + 1
        else:
            print ('Invalid date entered')
    elif day == 28:
        month = month +1
        day = 1
    elif day < 28 and day > 0:
        day = day + 1
    else:
        print ('Invalid date entered')
elif month == 4 or month == 6 or month == 9 or month == 11:
    if day == 30:
        month = month + 1
        day = 1
    elif day < 30 and day > 0:
        day = day + 1
    else:
        print ('Invalid date entered')
elif month == 12:
    if day == 31:
        month = 1
        day = 1
        year = year + 1
    elif day < 31 and day > 0:
        day = day + 1
    else:
        print ('Invalid date entered')
else:
    print ('Invalid date entered')
print(month, '/', day, '/', year)
