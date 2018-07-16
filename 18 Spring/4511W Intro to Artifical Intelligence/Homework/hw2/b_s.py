from search import *
import sys

if __name__ == '__main__':
    nqueens = NQueensProblem(int(sys.argv[1]))
    if sys.argv[2] == 'depth':
        depth_first_tree_search(nqueens)
    elif sys.argv[2] == 'iter':
        iterative_deepening_search(nqueens)
    elif sys.argv[2] == 'genetic':
        gene_pool = range(int(sys.argv[1]))
        population = init_population(100,gene_pool, int(sys.argv[1]))

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
            
        #fitness_min = math.floor((int(sys.argv[1])**2.1)*0.32)
        fitness_min = 25
        solution = genetic_algorithm(population, fitness, gene_pool=gene_pool, f_thres=fitness_min)
        print(solution)
        assert fitness(solution) >= 25
