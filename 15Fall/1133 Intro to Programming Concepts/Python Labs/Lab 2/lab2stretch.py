loan_amount = eval(input('Loan Amount: '))
r = eval(input('Annual Interest Rate: '))
n = eval(input('Loan Duration in Months: '))
payment = (r*loan_amount)/(1-((1+r)**-n))
print('$', payment)
