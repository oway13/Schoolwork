import math
import numpy as np

class node:
    def __init__(self, child1, child2, value):
        self.child1=child1
        self.child2=child2
        self.value=value
    def get_c1(self):
        return self.child1

    def set_c1(self, child):
        self.child1 = child

    def get_c2(self):
        return self.child2

    def set_c2(self, child):
        self.child2 = child

    def get_val(self):
        return self.value

    def set_val(self, val):
        self.val = val

def alphabeta(nodelist, node, depth, alpha, beta, maximizingPlayer):
    global memes
    if depth == 0 or node.child1 == None:
        return node.get_val()
    if maximizingPlayer:
        v = -math.inf
        v = max(v, alphabeta(nodelist, nodelist[node.get_c1()], depth-1, alpha, beta, False))
        alpha = max(alpha, v)
        memes+=1
        if beta <= alpha:
            return v
        v = max(v, alphabeta(nodelist, nodelist[node.get_c2()], depth-1, alpha, beta, False))
        alpha = max(alpha, v)
        memes+=1
        if beta <= alpha:
            return v
        return v
    else:
        v = math.inf
        v = min(v, alphabeta(nodelist, nodelist[node.get_c1()], depth-1, alpha, beta, True))
        beta = min(beta, v)
        memes+=1
        if beta <= alpha:
            return v
        v = min(v, alphabeta(nodelist, nodelist[node.get_c2()], depth-1, alpha, beta, True))
        beta = min(beta, v)
        memes+=1
        if beta <= alpha:
            return v
        return v

def alpha_beta_test(depth):
    nodelist = [None for i in range((2**(depth+1))-1)]
    for i in range(len(nodelist)):
        nodelist[i] = node((2*i)+1, (2*i)+2, -math.inf)
    for i in range((2**depth)-1,len(nodelist)):
                nodelist[i].set_val(len(nodelist)-i)
    alphabeta(nodelist, nodelist[0], depth, -math.inf, math.inf, True)

        

def main():
    global memes
    memes = 0
    alpha_beta_test(8)
    print(str(memes))
main()
    
        
