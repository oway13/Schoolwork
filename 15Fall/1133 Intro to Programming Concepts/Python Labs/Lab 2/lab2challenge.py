import time
totalSeconds = int(time.time())
days = totalSeconds//(60*60*24)
totalSeconds = totalSeconds % (60*60*24)
hours = totalSeconds//(60*60)
totalSeconds = totalSeconds % (60*60)
minutes = totalSeconds//60
tensMinutes = minutes//10
onesMinutes = minutes % 10
print(hours, ":", tensMinutes, onesMinutes)
