#Lab 12
import random
import turtle
def randColor():
    clist = ['red','yellow','green','blue','purple','orange']
    return clist[random.randint(0,5)]

#Lab 12 Stretch
class shape():
    def __init__(self, xloc=0,yloc=0,fcolor='',fill=False):
        self.__xloc = xloc
        self.__yloc = yloc
        self.__fcolor = fcolor
        self.__fill = fill

    def setFillcolor(self,newcolor):
        self.__fcolor = newcolor
    def setFilled(self, filled):
        self.__fill = filled
    def isFilled(self):
        return self.__fill
    def getFillColor(self):
        return self.__fcolor

class circle(shape):
    def __init__(self,xloc=0,yloc=0,radius=1):
        self.__xloc = xloc
        self.__yloc = yloc
        self.__radius = radius
        super().__init__()
    def draw(self,turtle):
        turtle.up()
        turtle.goto(self.__xloc,self.__yloc)
        turtle.down()
        turtle.circle(self.__radius)
        if super().isFilled:
            if super().getFillColor() != '':
                turtle.fillcolor(super().getFillColor())
            turtle.begin_fill()
            turtle.circle(self.__radius)
            turtle.end_fill()

#Lab 12 Workout
class Display():
    def mouseEvent(self,x,y):
        newc = circle(xloc=x,yloc=y,radius=random.randint(10,100))
        newc.setFillcolor(randColor())
        newc.setFilled(True)
        newc.draw(self.__myt)
    def __init__(self):
        self.__myt = turtle.Turtle()
        self.__myt.speed(0)
        self.__myt.ht()
        self.__tsc=turtle.Screen()
        self.__tsc.delay(delay=0)
        self.__elements = []
        self.__tsc.listen()
        self.__tsc.onclick(self.mouseEvent)
    

disp = Display()
