import turtle
import random

def gallows(tur):
    #Creates Gallows
    tur.up()
    tur.goto(0,0)
    tur.down()
    tur.goto(0,150)
    tur.goto(65,150)
    tur.goto(65,110)
    tur.up()
    
    
def wordselect():
    #Selects a Word from the List it Creates
    wlist = ['JAZZ','QUIZ','HYPOTENUSE','LYNX', \
             'FRIEND','CREW','CASSETTE','PREREQUISITE', \
             'SMILING','TASK','RECORDER','WORSE', \
             'ALLIANCE','MUST','DEFENSIVE','BEARING', \
             'FLOWER','BAGGAGE','PENNY','VALUE']
    return wlist[random.randint(0,19)]


def writeunder(tur, word):
    #Writes Underscores for each Letter in the Word
    tur.goto(0,-40)
    for i in range(len(word)):
        tur.write('_ ', True, 'left' , ('Arial', 12, 'normal'))


def hang(tur, wrong):
    #Determines # of Wrong Guess and Draws Appropriate Part
    if wrong == 1:
        tur.goto(65, 80)
        tur.down()
        tur.circle(15)
        tur.up()
    elif wrong == 2:
        tur.goto(65, 80)
        tur.down()
        tur.goto(65,30)
        tur.up()
    elif wrong == 3:
        tur.goto(65,30)
        tur.down()
        tur.goto(45,10)
        tur.up()
    elif wrong == 4:
        tur.goto(65,30)
        tur.down()
        tur.goto(85,10)
        tur.up()
    elif wrong == 5:
        tur.goto(65,70)
        tur.down()
        tur.goto(45,90)
        tur.up()
    elif wrong == 6:
        tur.goto(65,70)
        tur.down()
        tur.goto(85,90)
        tur.up()

        
def corr(tur, ltr, word):
    #Recursively Writes All Instances of Correctly Guessed Letter
    n = word.rfind(ltr)
    if len(ltr) == 1:
        if word.count(ltr) == 1:
            tur.goto(n*12, -39)
            tur.write(ltr, False, 'left', ('Arial', 10, 'normal'))
            tur.write(' ', False, 'left', ('Arial', 10, 'normal'))
        else:
            tur.goto(n*12, -39)
            tur.write(ltr, True, 'left', ('Arial', 10, 'normal'))
            tur.write(' ', True, 'left', ('Arial', 10, 'normal'))
            corr(tur, ltr, word[:n])
    else:
        for n in range(len(ltr)):
            tur.goto(n*12, -39)
            tur.write(ltr[n], False, 'left', ('Arial', 10, 'normal'))

            
def wro(tur, wguess):
    #Writes Incorrect Guesses
    tur.goto(75, 150)
    for i in range(len(wguess)):
        tur.write(wguess[i], True, 'left', ('Arial', 10, 'normal'))
        tur.write('       ', True, 'left', ('Arial', 10, 'normal'))
    
           
def guess(tur, word):
    #Asks for a Guess, Determines if it is Correct
    #Loops until Word Guessed or Out of Guesses, Returns Result
    wrong = 0
    correct = 0
    cguess = []
    wguess = []
    while wrong < 6 and correct < len(word):
        iltr = turtle.textinput('Hangman', 'Guess a single letter or the word:')
        iltr = iltr.upper()
        if (iltr not in word or (len(iltr) < len(word) and len(iltr) > 1)):
            wrong += 1
            wguess += [iltr]
            wro(tur, wguess)
            hang(tur, wrong)
        elif iltr in word and iltr not in cguess:
            correct += (word.count(iltr)*len(iltr))
            cguess += iltr
            corr(tur, iltr, word)
    if wrong == 6:
        return False
    else:
        return True

def redo(tur, result):
    #Asks if User Wants to Play Again
    #Loops until Player Enters Valid Input
    valid = False
    while not valid:
        if result:
            tur.goto(0, -75)
            tur.write('Congratulations!!', True, 'left', ('Arial', 10, 'normal'))
            icont = turtle.textinput('Congratulations!!', 'Would you like to play again? (y/n)').lower()
        else:
            tur.goto(0, -75)
            tur.write('Sorry, you lose!', True, 'left', ('Arial', 10, 'normal'))
            icont = turtle.textinput('Sorry, you lose!', 'Would you like to play again? (y/n)').lower()
        if icont == 'y':
            valid = True
            return True
        elif icont == 'n':
            valid = True
            return False

def main():
    #Sets Everything Up, Calls Most Functions, Displays Result, Resets
    #Loops when User Enters 'y' until User Eays 'n'
    cont = True
    while cont:
        htur = turtle.Turtle()
        htur.speed(0)
        htur.hideturtle()
        gallows(htur)
        word = wordselect()
        writeunder(htur, word)
        result = guess(htur, word)
        htur.goto(0, -55)
        htur.write(word, True, 'left', ('Arial', 10, 'normal'))
        cont = redo(htur, result)
        htur.reset()
    turtle.bye()
    
    
main()
