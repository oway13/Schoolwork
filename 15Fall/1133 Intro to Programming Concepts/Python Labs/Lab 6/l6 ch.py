sud1 = [[5,3,4,6,7,8,9,1,2], \
        [6,7,2,1,9,5,3,4,8], \
        [1,9,8,3,4,2,5,6,7], \
        [8,5,9,7,6,1,4,2,3], \
        [4,2,6,8,5,3,7,9,1], \
        [7,1,3,9,2,4,8,5,6], \
        [9,6,1,5,3,7,2,8,4], \
        [2,8,7,4,1,9,6,3,5], \
        [3,4,5,2,8,6,1,7,9] ]
sud2 = [ [5,3,4,6,7,8,9,1,2], \
         [6,7,2,1,9,5,3,4,8], \
         [1,9,8,3,4,2,4,6,7], \
         [8,5,9,7,6,1,5,2,3], \
         [4,2,6,8,5,3,7,9,1], \
         [7,1,3,9,2,4,8,5,6], \
         [9,6,1,5,3,7,2,8,4], \
         [2,8,7,4,1,9,6,3,5], \
         [3,4,5,2,8,6,1,7,9] ]


def checkSudoku(sud):
    corrsol = True
    tonine = '12345679'
    for i in range(9):
        
        for ni in range(9):
            if str(sud[i][ni]) not in tonine:
                corrsol = False
            if str(sud[ni][i]) not in tonine:
                corrsol = False
    for j in range(3):
        for l in range(3):
            subsquare = []
            for n in range(3):
                for k in range(3):
                    subsquare += str(sud[j*3+n][l*3+k])
            for ni in range(9):
                if subsquare[ni] not in tonine:
                    corrsol = False
    return corrsol


if checkSudoku(sud1) == True:
    print('Correct Solution')
else:
    print('Not A Solution')
if checkSudoku(sud2) == True:
    print('Correct Solution')
else:
    print('Not A Solution')
