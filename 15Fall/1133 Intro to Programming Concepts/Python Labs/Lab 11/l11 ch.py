#Lab 11 Challenge 1: Basic Polynomial Class
class Poly:
    def __init__(self,coeff=[0]):
        self.coefficient = coeff

    def degree(self):
        return len(self.coefficient)-1

    def addterm(self,exp,coe):
        addlen = exp-(len(self.coefficient)-1)
        if addlen > 0:
            for i in range(addlen-1):
                self.coefficient.append(0)
            self.coefficient.append(coe)
        else:
            self.coefficient[exp+1] = coe
        return Poly(self.coefficient)

    def __str__(self):
        retstr = ''
        for i in range(len(self.coefficient)-1,-1,-1):
            if self.coefficient[i] != 0:
                if self.coefficient[i] < 0:
                    retstr += '-'
                elif i != len(self.coefficient)-1:
                    retstr += '+'
                if i > 1:
                    if self.coefficient[i] != 1:
                        retstr += str(abs(self.coefficient[i]))+'x^'+str(i)
                    else:
                        retstr += 'x^'+str(i)
                elif i == 1:
                    retstr += str(abs(self.coefficient[i]))+'x'
                else:
                    retstr+=str(abs(self.coefficient[i]))
        return retstr

                    
