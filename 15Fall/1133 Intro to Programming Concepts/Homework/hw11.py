#Homework 11
class Vehicle():
    def __init__(self, make='vehicle_make',year='vehicle_year', \
                 model='vehicle_make',miles='vehicle_miles', \
                 price='vehicle_price'):
        self.__make = make
        self.__year = year
        self.__model = model
        self.__miles = miles
        self.__price = price
        
    def getMake(self):
        return self.__make
    def setMake(self,newmake):
        self.__make = newmake
        
    def getYear(self):
        return self.__year
    def setYear(self,newyear):
        self.__year = str(newyear)

    def getModel(self):
        return self.__model
    def setModel(self,newmodel):
        self.__model = newmodel

    def getMiles(self):
        return self.__miles
    def setMiles(self,newmiles):
        self.__miles = str(newmiles)

    def getPrice(self):
        return self.__price
    def setPrice(self,newprice):
        self.__price = newprice

    def Display(self):
        print('Make:',self.__make)
        print('Year:',self.__year)
        print('Model:',self.__model)
        print('Miles:',self.__miles)
        if type(self.__price) == float or type(self.__price) == int:
            print('Price:','$'+str(format(self.__price, '0.2f')))
        else:
            print('Price:',self.__price)
        
class Car(Vehicle):
    def __init__(self,doors='car_doors(2/4)'):
        self.__doors = str(doors)
        super().__init__()

    def getDoors(self):
        return self.__doors
    def setDoors(self,newdoors):
        self.__doors = str(newdoors)

    def Display(self):
        print('Inventory unit: Car')
        super().Display()
        print('Number of Doors:', self.__doors)
        
class Truck(Vehicle):
    def __init__(self,drive='truck_drive(2/4)'):
        self.__drive = str(drive)+'-wheel drive'
        super().__init__()

    def getDrive(self):
        return self.__drive
    def setDrive(self,newdrive):
        self.__drive  = str(newdrive)+'-wheel drive'

    def Display(self):
        print('Inventory unit: Truck')
        super().Display()
        print('Drive type:',self.__drive) 

class SUV(Vehicle):
    def __init__(self,passcap='suv_passengercap'):
        self.__capacity=passcap
        super().__init__()

    def getPassCap(self):
        return self.__capacity
    def setPassCap(self,newpasscap):
        self.__capacity = str(newpasscap)

    def Display(self):
        print('Inventory unit: SUV')
        super().Display()
        print('Passenger Capacity:',self.__capacity)

class Inventory():
    def __init__(self,vehlist=[]):
        self.__vlist = vehlist

    def addVehicle(self,vehicle):
        self.__vlist += [vehicle]

    def Display(self):
        for veh in self.__vlist:
            print('')
            veh.Display()
            print('')


def main():
    mainInv = Inventory()
    cont = True
    while cont:
        vtype = input('Enter a vehicle type to add (car, truck, suv): ')
        vtype = vtype.lower().strip()
        if vtype == 'car':
            newveh = Car()
            newveh.setDoors(input('Enter Number of Car Doors (2/4): '))
            validveh = True
        elif vtype == 'truck':
            newveh = Truck()
            newveh.setDrive(eval(input('Enter Drive type (2/4)-wheel: ')))
            validveh = True
        elif vtype == 'suv':
            newveh = SUV()
            newveh.setPassCap(passcap=input('Enter Passenger Capacity: '))
            validveh = True
        else:
            print('Invalid Vehicle Type Entered')
            validveh = False
        if validveh == True:
            newveh.setMake(input('Enter Vehicle Make: '))
            newveh.setYear(input('Enter Vehicle Year: '))
            newveh.setModel(input('Enter Vehicle Model: '))
            newveh.setMiles(input('Enter Vehicle Miles: '))
            newveh.setPrice(eval(input('Enter Vehicle Price: ')))
            mainInv.addVehicle(newveh)
        
        validcheck = False
        while not validcheck:
            concheck = input('Add another vehicle? (y/n): ')
            concheck = concheck.lower().strip()
            if concheck == 'y':
                validcheck = True
                cont = True
            elif concheck == 'n':
                validcheck = True
                cont = False
            else:
                validcheck = False
    mainInv.Display()

main()



