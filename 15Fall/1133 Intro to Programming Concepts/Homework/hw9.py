def convert(nstr):
    l2ncon = {'2':['a','b','c'],'3':['d','e','f'],'4':['g','h','i'], \
              '5':['j','k','l'],'6':['m','n','o'],'7':['p','q','r','s'], \
              '8':['t','u','v'],'9':['w','x','y','z']}
    nstr = nstr.strip().lower()
    for char in ',.?[]{}():!@#$%^&*\'\"/-_ ':
        nstr = nstr.replace(char, '')
    if len(nstr) == 7 or len(nstr) == 10:
        for ltr in nstr:
            for key in l2ncon:
                if ltr in l2ncon[key]:
                    nstr = nstr.replace(ltr,key)
        nstr = nstr[:3]+'-'+nstr[3:]
        if len(nstr) == 11:
            nstr = nstr[:7]+'-'+nstr[7:]
        return nstr
    else:
        return False

def main():
    istr = ' '
    while istr != '':
        istr = input('Enter a Telephone Number (7 or 10 digit): ')
        if istr  != '':
            retstr = convert(istr)
            if retstr == False:
                print('Invalid Number')
            else:
                print('Numeric Telephone Number: ', retstr)
        
