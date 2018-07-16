import pytest
from search import *
import math
import time

def main():
    with open("gc.csv", "w") as file:
        file.write("N,fitness,population,time\n")
        for i in range(8, 21, 4):
            for j in range(1,5):
                start = time.time()
                fn = test_genetic_algorithm(i, 100, j*250)
                end = time.time()
                file.write(str(i)+","+str(fn)+","+str(j*33)+","+str(end-start)+"\n")
        

def test2():
    with open("gb.csv", "w") as file:
        file.write("ngen,population,time\n")
        for i in range(5):
            for j in range(1,4):
                start = time.time()
                test_genetic_algorithm(20, j*33, i*250)
                end = time.time()
                file.write(str(i*250)+","+str(j*33)+","+str(end-start)+"\n")

def test_genetic_algorithm(n_queens, pop, ngenx):
    gene_pool = range(n_queens)
    population = init_population(pop, gene_pool, n_queens)

    def fitness(q):
        non_attacking = 0
        for row1 in range(len(q)):
            for row2 in range(row1+1, len(q)):
                col1 = int(q[row1])
                col2 = int(q[row2])
                row_diff = row1 - row2
                col_diff = col1 - col2
                if col1 != col2 and row_diff != col_diff and row_diff != -col_diff:
                    non_attacking += 1

        return non_attacking


    solution = genetic_algorithm(population, fitness, gene_pool=gene_pool, ngen=ngenx)
    print(solution)
    return fitness(solution)



    
main()
