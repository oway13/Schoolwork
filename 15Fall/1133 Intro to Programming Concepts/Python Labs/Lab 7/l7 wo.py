def choose(n, k):
    if k == 0 or n == k:
        return 1
    else:
        return choose(n-1, k-1)+choose(n-1, k)
