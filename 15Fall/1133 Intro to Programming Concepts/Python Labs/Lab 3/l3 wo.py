month = int(input('Enter month: ' ))
date = int(input('Enter day: '))
year = int(input('Enter year: '))

if month == 1 or month == 2:
    mmonth = month + 12
    myear = year - 1
else:
    mmonth = month
    myear = year
dayval = (date+5+((26*(mmonth+1))//10)+(5*(myear%100)//4)+((21*(myear//100))//4)) % 7

if dayval == 0:
    day = 'Monday'
elif dayval == 1:
    day = 'Tuesday'
elif dayval == 2:
    day = 'Wednesday'
elif dayval == 3:
    day = 'Thursday'
elif dayval == 4:
    day = 'Friday'
elif dayval == 5:
    day = 'Saturday'
elif dayval == 6:
    day = 'Sunday'
print(month, '/', date, '/', year, 'is a ', day)
