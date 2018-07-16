import pytest
from search import *
import math

def main():
    test_genetic_algorithm(11)
    test_depth_first_tree_search(11)
    test_iterative_deepening_search(11)
##    test_genetic_algorithm(11)
##    test_genetic_algorithm(20)
##    test_genetic_algorithm(40)


def test_genetic_algorithm(n_queens):
    gene_pool = range(n_queens)
    population = init_population(100, gene_pool, n_queens)

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

    fitness_min = math.floor((n_queens**2.1)*0.32)
    solution = genetic_algorithm(population, fitness, gene_pool=gene_pool, f_thres=fitness_min)
    print(solution)
    assert fitness(solution) >= 25

def test_depth_first_tree_search(n_queens):
    print(depth_first_tree_search(NQueensProblem(n_queens)))

def test_iterative_deepening_search(n_queens):
    print(iterative_deepening_search(NQueensProblem(n_queens)))


test_genetic_algorithm(40)
    
