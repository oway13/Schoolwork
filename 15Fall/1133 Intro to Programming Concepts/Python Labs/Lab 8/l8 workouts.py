##Lab 8 Workout 1: Split
def mysplit(stringarg, delimiter):
    slist = []
    for i in range(stringarg.count(delimiter)):
        slist += [stringarg[:stringarg.find(delimiter)]]
        stringarg = stringarg.replace(stringarg[:stringarg.find(delimiter)+len(delimiter)],'')
    slist += [stringarg]
    return slist
    
##Lab 8 Workout 2: DNA
def dnaseq():
    dna = input('Enter a DNA sequence: ')
    dnalst = dna.split('ATG')
    for i in range(len(dnalst)-1):
        if 'TAG' not in dnalst[i] and 'TGA' not in dnalst[i] and 'TAA' not in dnalst[i]:
            del dnalst[i]
    for i in range(len(dnalst)):
        if 'TAG' in dnalst[i] and len(dnalst[i][:dnalst[i].find('TAG')]) % 3 == 0:
            gene = dnalst[i][:dnalst[i].find('TAG')]
            print('Gene', i+1, gene)
        elif 'TGA' in dnalst[i] and len(dnalst[i][:dnalst[i].find('TGA')]) % 3 == 0:
            gene = dnalst[i][:dnalst[i].find('TGA')]
            print('Gene', i+1, gene)
        elif 'TAA' in dnalst[i] and len(dnalst[i][:dnalst[i].find('TAA')]) % 3 == 0:
            gene = dnalst[i][:dnalst[i].find('TAA')]
            print('Gene', i+1, gene)
        else:
            del dnalst[i]
