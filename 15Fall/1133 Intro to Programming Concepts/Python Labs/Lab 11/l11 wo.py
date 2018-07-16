#Lab 11 Workout: Vector Class
class vec3:
    def __init__(self,vector = [0,0,0]):
        self.veclst = vector
        self.v1 = vector[0]
        self.v2 = vector[1]
        self.v3 = vector[2]

    def __str__(self):
        return '['+str(self.v1)+','+str(self.v2)+','+str(self.v3)+']'

    def vlist(self):
        return self.veclst

    def setValues(self,vector):
        self.veclst = vector
        self.v1 = vector[0]
        self.v2 = vector[1]
        self.v3 = vector[2]

    def __float__(self):
        return ((self.v1**2)+(self.v2**2)+(self.v3**2))**.5

    def __add__(self,x):
        return vec3([self.v1+x.v1,self.v2+x.v2,self.v3+x.v3])

    def __truediv__(self,x):
        return vec3([self.v1/x,self.v2/x,self.v3/x])

def accel(vect1,vect2,mass):
    vect1 = vec3(vect1)
    vect2 = vec3(vect2)
    print('Vector of Acceleration: ',(vect1+vect2)/mass)
    print('Magnitude of Acceleration:', float((vect1+vect2)/mass))


accel([3,4,5],[5,12,13],10)
        
