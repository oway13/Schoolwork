import math
plist = [[45,-99],[24,83],[-48,-68],[-97,99],   \
         [-8,-77],[-2,50],[44,41],[-48,-58],    \
         [-1,53],[14,86], [31, 94],[12, -91],   \
         [33,50],[82,72],[83,-90],[10,78],      \
         [7,-22],[90,-88],[-21,5],[6,23]]
def shortestDist(points):
    shortest = 999999999
    for i in range(0,len(points)):
        for ni in range(i+1,len(points)):
            dist = math.sqrt(((points[i][0]-points[ni][0])**2)+((points[i][1]-points[ni][1])**2))
            if dist < shortest:
                shortest = dist
    print(shortest)
shortestDist(plist)
