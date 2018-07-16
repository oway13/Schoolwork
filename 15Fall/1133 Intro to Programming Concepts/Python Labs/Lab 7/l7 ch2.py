import turtle
import math
myt = turtle.Turtle()
myt.speed(0)

def drawsquare(tobj, leng):
    tobj.pendown()
    for  i in range(1,5):
        tobj.forward(leng)
        tobj.right(90)
    tobj.penup()
    
def gotocenter(tobj, leng):
    tobj.right(45)
    tobj.forward((leng/2)*math.sqrt(2))
    tobj.left(45)
    return tobj.pos()

def rightsquare(tobj, leng):
    tobj.left(45)
    tobj.forward(leng/4)
    tobj.right(45)
    tobj.forward(leng)

def siercarp(tobj,leng):
    if leng < 2:
        return
    else:
        drawsquare(tobj,leng)
        home = gotocenter(tobj, leng)
        tobj.goto(home)
        rightsquare(tobj, leng)
        siercarp(tobj,leng/2)

siercarp(myt, 250)
