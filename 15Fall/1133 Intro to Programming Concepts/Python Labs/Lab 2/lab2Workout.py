userInt = eval(input('Enter a 4 Digit Positive Integer: '))
thousands = userInt//1000
hundreds = (userInt % 1000)//100
tens = ((userInt % 1000) % 100)//10
ones = (((userInt % 1000) % 100) % 10)
print(thousands)
print(hundreds)
print(tens)
print(ones)
