import turtle
import random

myt = turtle.Turtle()

def tree(t, trunkLength):
    t.speed(0)

    if trunkLength < 5:
        return
    else:
        angle = random.randint(15, 45)
        tlen = random.randint(12, 18)
        t.forward(trunkLength)
        t.right(angle)
        tree(t, trunkLength-tlen)
        t.left(2*angle)
        tree(t, trunkLength-tlen)
        t.right(angle)
        t.backward(trunkLength)

tree(myt, 100)
