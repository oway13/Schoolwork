def gcd(a, b):
    if a < 0 or b < 0:
        return gcd(abs(a), abs(b))
    elif a < b:
        return gcd(b, a)
    elif b == 0:
        return a
    else:
        return gcd(b, a%b)
