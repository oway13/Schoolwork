mement = eval(input('Enter numeric value: '))
units = str(input('Enter units: '))

if units == 'pounds':
    convert = mement*0.453592
    conunit = 'kilograms'
    
elif units == 'ounces':
    convert = mement*28.3495
    conunit = 'grams'
    
elif units == 'miles':
    convert = mement*1.60934
    conunit = 'kilometers'
    
elif units == 'inches':
    convert = mement*2.54
    conunit = 'centimeters'
    
elif units == 'kilograms':
    convert = mement*2.20462
    conunit = 'pounds'
    
elif units == 'grams':
    convert = mement*0.035274
    conunit = 'ounces'
    
elif units == 'kilometers':
    convert = mement*0.621371
    conunit = 'miles'
    
elif units == 'centimeters':
    convert = mement*0.393701
    conunit = 'inches'
    
else:
    print('Invalid unit selection: ', units)
    convert = 0
    conunit = 'error'
print(mement, units, 'is equal to', format(convert, '.2f'), conunit)
