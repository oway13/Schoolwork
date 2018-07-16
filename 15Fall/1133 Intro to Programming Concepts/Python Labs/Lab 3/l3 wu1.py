gender = str(input('Male(M) or Female(F): '))
weight = eval(input('Weight in pounds: '))
height = eval(input('Height in inches: '))
age = eval(input('Age in years: '))
bmr = 0
bars = 0

if gender == 'F':
    bmr = 655+(4.3*weight)+(4.7*height)-(4.7*age)
    print('BMR:', bmr)
    bars = bmr/230
    print(format(bars, '.2f'), 'bars')
elif gender == 'M':
    bmr = 66+(6.3*weight)+(12.9*height)-(6.8*age)
    print('BMR:', bmr)
    bars = bmr/230
    print(format(bars, '.2f'), 'bars')
else:
    print('Invalid Gender Selection (M/F)')
