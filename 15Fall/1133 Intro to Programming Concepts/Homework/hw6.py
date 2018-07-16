def bsearch(lst, key, start, end):
    middle = (start+end)//2
    if key < lst[start] or key > lst[end]:
        return None
    elif key == lst[middle]:
        return middle
    elif key in lst[start:middle]:
        return bsearch(lst, key, start, middle)
    elif key in lst[middle:end]:
        return bsearch(lst, key, middle, end)
    elif key == lst[end]:
        return end


    
def main():
    start = 0 #indeces
    end = 9
    nlist = [x for x in range(1,11)]
    for i in range(11,0,-1):
        print(bsearch(nlist, i, start, end))


main()
