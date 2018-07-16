import turtle
myturtle = turtle.Turtle()

def drawsquare(tobj, leng):
    tobj.pendown()
    for  i in range(1,5):
        tobj.forward(leng)
        tobj.left(90)
    tobj.penup
def rotsquare(tobj, squares):
    for i in range(1,squares+1):
        drawsquare(tobj, 10)
        tobj.left(360/squares)

#leng = eval(input('Enter Square Side Length: '))
#drawsquare(myturtle, leng)
squares = eval(input('Enter # Squares to draw: '))
rotsquare(myturtle,squares)
    
