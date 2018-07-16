cont = True
redo = 'y'
#Indefinite loop to let user continue to use program
while cont == True:
    #vars
    isbn = input('Enter a 9 digit integer: ')
    isbnum = int(isbn)
    n = 1
    digsum = 0
    mult = 10
    digit = 100000000
    checksum = 0
    validredo = False

    #input validation
    if len(isbn) == 9 and isbnum >= 0:
            
        #Summed 9 digits
        while n <= 9:
            digsum += (isbnum//digit)*mult
            n += 1
            mult -= 1
            isbnum = (isbnum % digit)
            digit = digit//10
            
        #Exhaustive Enumeration to Find Checksum digit
        n = 1
        while n <= 10:
            if (n+digsum) % 11 == 0:
                checksum = n
            n += 1
        #Output ISBN
        if checksum == 10:
            isbnum = int(isbn)
            print('ISBN: ', format(isbnum, '09'), end='')
            print('X')
        else:
            isbnum = (int(isbn)*10)+checksum
            print('ISBN: ', format(isbnum, '010'))
        
    else:
        print('Invalid Input. Input must be 9 digits')
        
    #Checking if user wants to try again    
    while not validredo:        
        redo = (input('Would you like to continue? (y or n) '))
        if redo == 'n':
            cont = False
            validredo = True
        elif redo == 'y':
            cont = True
            validredo = True
        else:
            print('Invalid Input. Input must be y or n')
