#Input Day/Month of Birth
month = int(input("Enter birth month #: "))
day = int(input("Enter birth day: "))

#Account for invalid entries
#Determine Zodiac Sign
if day < 1 or month < 1 or month > 12:
    print("Invalid birth date entered")
    zodiac = 'error'
elif (month == 1 or month == 3 or month == 5 or month == 7 or month == 8 or month == 10 or month == 12) and day > 31:
    print("Invalid birth date entered")
    zodiac = 'error'
elif (month == 2) and day > 29:
    print("Invalid birth date entered")
    zodiac = 'error'
elif (month == 4 or month == 6 or month == 9 or month == 11) and day > 30:
    print("Invalid birth date entered")
    zodiac = 'error'
elif (month == 1 and day >= 20) or (month == 2 and day <= 18):
    zodiac = 'Aquarius'
elif month == 2 or (month == 3 and day <= 20):
    zodiac = 'Pisces'
elif month == 3 or (month == 4 and day <=19):
    zodiac = 'Aries'
elif month == 4 or (month == 5 and day <= 20):
    zodiac = 'Taurus'
elif month == 5 or (month == 6 and day <= 20):
    zodiac = 'Gemini'
elif month == 6 or (month == 7 and day <= 22):
    zodiac = 'Cancer'
elif month == 7 or (month == 8 and day <= 22):
    zodiac = 'Leo'
elif month == 8 or (month == 9 and day <= 22):
    zodiac = 'Virgo'
elif month == 9 or (month == 10 and day <= 22):
    zodiac = 'Libra'
elif month == 10 or (month == 11 and day <= 21):
    zodiac = 'Scorpio'
elif month == 11 or (month == 12 and day <= 21):
    zodiac = 'Sagittarius'
elif month == 12 or month == 1:
    zodiac = 'Capricorn'
else:
    print("Invalid birth date entered")
    zodiac = 'error'

#Output Zodiac Sign
if zodiac != 'error':
    print("The zodiac for birthday ", month, "/", day, "is: ", zodiac)
