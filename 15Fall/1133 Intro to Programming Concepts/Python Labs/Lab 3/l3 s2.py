xval = float(input('First value x: '))
yval = float(input('Second value y: '))
zval = float(input('Third value z: '))

if xval >= yval and xval >= zval:
    #x greatest -> x
    #x=y > z -> x/y
    #x=y=z -> x/y/z
    print(xval, 'is the largest value')
elif yval > xval and yval >= zval:
    #y greatest -> y
    #y=z  > x -> y/z
    print(yval, 'is the largest value')
elif zval > xval and zval > yval:
    #z greatest -> z
    print(zval, 'is the largest value')
