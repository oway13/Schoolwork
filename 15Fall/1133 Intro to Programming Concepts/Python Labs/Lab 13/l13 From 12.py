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
        self.__center = (self.__xloc,self.__yloc+self.__radius)
        super().__init__()
    def draw(self,turtle):
        turtle.up()
        turtle.goto(self.__xloc,self.__yloc)
        turtle.down()
        turtle.circle(self.__radius)
        if self.isFilled() == True:
            if self.getFillColor() != '':
                turtle.fillcolor(self.getFillColor())
            turtle.begin_fill()
            turtle.circle(self.__radius)
            turtle.end_fill()
        turtle.up()
#Lab 13 Workout
    def isIN(self,x,y):
        dist = (((abs(x-self.__center[0])**2)+(abs(y-self.__center[1])**2))**.5)
        if dist <= self.__radius:
            return True
        else:
            return False
                
        
#Lab 13 Stretch
class rectangle(shape):
    def __init__(self,xloc=0,yloc=0, width=1,height=1):
        self.__xloc = xloc
        self.__yloc = yloc
        self.__width = width
        self.__height = height
        super().__init__()
    def draw(self,turtle):
        turtle.up()
        turtle.goto(self.__xloc,self.__yloc)
        turtle.down()
        turtle.seth(90)
        turtle.fd(self.__height)
        turtle.seth(180)
        turtle.fd(self.__width)
        turtle.seth(270)
        turtle.fd(self.__height)
        turtle.seth(0)
        turtle.fd(self.__width)
        if self.isFilled() == True:
            if self.getFillColor() != '':
                turtle.fillcolor(self.getFillColor())
            turtle.begin_fill()
            turtle.seth(90)
            turtle.fd(self.__height)
            turtle.seth(180)
            turtle.fd(self.__width)
            turtle.seth(270)
            turtle.fd(self.__height)
            turtle.seth(0)
            turtle.fd(self.__width)
            turtle.end_fill()
        turtle.up()
    def isIN(self,x,y):
        if x <= self.__xloc and x >= (self.__xloc-self.__width) and \
           y >= self.__yloc and y <= (self.__yloc+self.__height):
            return True
        else:
            return False
        
#Lab 12 Workout
class Display():
    def mouseEvent(self,x,y):
        deld = False
        for shp in self.__elements:
            if shp.isIN(x,y):
                if type(shp) != Button:
                    self.remove(shp)
                    deld = True
                else:
                    self.__shape = not self.__shape
                    deld = True
        if deld == False:
            if self.__shape:
                news = circle(xloc=x,yloc=y,radius=random.randint(10,100))
            else:
                news = rectangle(xloc=x,yloc=y,width=random.randint(10,100), \
                                 height=random.randint(10,100))
            news.setFillcolor(randColor())
            news.setFilled(True)
            self.add(news)
    def __init__(self):
        self.__myt = turtle.Turtle()
        self.__myt.speed(0)
        self.__myt.ht()
        self.__shape = True
        self.__tsc=turtle.Screen()
        self.__tsc.delay(delay=0)
        self.__elements = []
        self.__tsc.listen()
        self.__tsc.onclick(self.mouseEvent)
#Lab 13 Warmup    
    def add(self,shape):
        self.__elements.append(shape)
        shape.draw(self.__myt)
    def remove(self,shape):
        self.__myt.clear()
        del self.__elements[self.__elements.index(shape)]
        for shp in self.__elements:
            shp.draw(self.__myt)
        
#Lab 13 Challenge
class Button(rectangle):
    def __init__(self,text='', xloc=0, yloc=0):
        super().__init__(width=75,height=45)
        self.__buttext = text
        self.__xloc = xloc
        self.__yloc = yloc
    def draw(self, turtle):
        super().draw(turtle)
        turtle.goto((-50),(+15))
        turtle.write(self.__buttext)
        
        


disp = Display()
shbutton = Button(xloc=100,yloc=100,text='shape')
disp.add(shbutton)










