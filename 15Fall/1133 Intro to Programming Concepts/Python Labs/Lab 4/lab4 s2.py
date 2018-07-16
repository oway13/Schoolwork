import math
tolerance = float(input('Input tolerance: '))
interpi = 0
pivalue = 0
n = 0
tolcheck = False
mult = 6/math.sqrt(3)
while not tolcheck:
    interpi = 1/(((-3)**n)*(2*n+1))
    checkval = abs((mult*(interpi+pivalue))-(mult*pivalue))
    if checkval < tolerance:
        tolcheck = True
        pivalue *= mult
    else:
        n += 1
        pivalue += interpi
print('Value: ', pivalue, 'in', n, 'approximations')
    
