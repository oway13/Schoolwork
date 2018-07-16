#Lab 11 Stretch
class measure:
    def __init__(self, ft=0,inch=0):
        self.feet = 0
        if ft == 0:
            self.feet += inch//12
            self.inches = inch % 12
        else:
            self.feet = ft
            self.inches = inch
            
    def __str__(self):
        retstr = ''
        if self.feet != 0:
            retstr += str(self.feet)+"'"
        if self.inches != 0:
            retstr += str(self.inches)+'"'
        if self.inches == 0 and self.feet == 0:
            retstr = '0'
        return retstr
    def __add__(self,x):
        return measure(self.feet+x.feet+((self.inches+x.inches)//12), (self.inches+x.inches)%12)
    def __sub__(self,x):
        return measure(self.feet-x.feet+(self.inches-x.inches)//12, (self.inches-x.inches)%12)


def main():
    m1 = measure()
    m2 = measure(4,11)
    m3 = measure(6,10)
    print(m1)
    print(m2+m3)
    print(m3-m2)
