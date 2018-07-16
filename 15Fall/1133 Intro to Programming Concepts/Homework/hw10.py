class Stack:
    def __init__(self,ilst=[]):
        self.__stack = ilst

    def push(self, obj):
        self.__stack += [obj]

    def pop(self):
        if len(self.__stack) > 0:
            ret = self.__stack[-1]
            del self.__stack[-1]
            return ret
        else:
            return None

    def isEmpty(self):
        if len(self.__stack) == 0:
            return True
        else:
            return False

    def __repr__(self):
        retstr = ''
        for i in range(len(self.__stack),0,-1):
            i -= 1
            retstr += str(self.__stack[i])+','
        retstr = retstr[:-1]
        return retstr

    def head(self):
        if len(self.__stack) > 0:
            return self.__stack[-1]
        else:
            return None

def testStack(ststr):
    tstack = Stack()
    pstr = ''
    for let in ststr:
        tstack.push(let)
    ret = ' '
    while ret != None:
        ret = tstack.pop()
        if ret != None:
            pstr += ret+' '
    print(pstr)

testStack('python')

def convertToRPN(infstr):
    poststr = ''
    rpnst = Stack()
    for let in range(len(infstr)):
        if infstr[let] in '1234567890.':
            if let-1 >= 0 and infstr[let-1] not in '1234567890.':
                if poststr != '' and poststr[-1] != ' ':
                    poststr += ' '
                poststr += infstr[let]
                if let < len(infstr)-1 and infstr[let+1] not in '1234567890.':
                    poststr += ' '
            else:
                poststr += infstr[let]
        elif infstr[let] == '(':
            rpnst.push(infstr[let])
        elif infstr[let] in '*/':
            rpnst.push(infstr[let])
        elif infstr[let] in '+-':
            if rpnst.head() == None:
                rpnst.push(infstr[let])
            elif rpnst.head() != None and rpnst.head() in '+-':
                rpnst.push(infstr[let])
            elif rpnst.head() != None and rpnst.head() in '*/':
                while rpnst.head() not in '+-':
                    poststr += rpnst.pop()+' '
                rpnst.push(infstr[let])
            else:
                rpnst.push(infstr[let])
        elif infstr[let] == ')':
            ret = ''
            while ret != '(':
                ret = rpnst.pop()
                if ret != '(':
                    poststr += ret+' '
    ret2 = ''
    while ret2 != None:
        ret2 = rpnst.pop()
        if ret2 != None:
            poststr += ' '+ret2            
    return poststr

def main():
    istr = input('Enter an Arithmetic Expression: ')
    rpnstr = convertToRPN(istr)
    print(rpnstr)

main()


        
