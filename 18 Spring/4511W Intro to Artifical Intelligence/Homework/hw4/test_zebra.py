from csp import *

def Bebra():
    """Return an instance of the Zebra Puzzle."""
    Names = 'Albert Dietfried Virgilijus Gallchobhar Bricius'.split()
    Sports = 'Baseball Rugby Soccer Starcraft2 Debates'.split()
    Transportation = 'Walking Motorcycle Car Bicycle Bus'.split()
    Lawns = 'Clean-cut Trees Astroturf Rocks Flowers'.split()
    variables = Names+Sports+Transportation+Lawns
    domains = {}
    for var in variables:
        domains[var] = list(range(1, 6))
    domains['Bicycle'] = [4]
    domains['Debates'] = [2]
    neighbors = parse_neighbors("""Albert: Baseball; Dietfried: Clean-cut;
    Virgilijus: Rugby; Gallchobhar: Walking; Astroturf: Baseball;
    Baseball: Motorcycle; Soccer: Bus""", variables)
    for type in [Names, Sports, Transportation, Lawns]:
        for A in type:
            for B in type:
                if A != B:
                    if B not in neighbors[A]:
                        neighbors[A].append(B)
                    if A not in neighbors[B]:
                        neighbors[B].append(A)

    def zebra_constraint(A, a, B, b, recurse=0):
        same = (a == b)
        next_to = abs(a - b) == 1
        if A == 'Albert' and B == 'Baseball':
            return same
        if A == 'Dietfried' and B == 'Clean-cut':
            return same
        if A == 'Virgilijus' and B == 'Rugby':
            return same
        if A == 'Gallchobhar' and B == 'Walking':
            return same
        if A == 'Astroturf' and B == 'Baseball':
            return same
        if A == 'Baseball' and B == 'Motorcycle':
            return same
        if A == 'Soccer' and B == 'Bus':
            return same
        if A == 'Bricius' and B == 'Virgilijus':
            return next_to
        if A == 'Flowers' and B == 'Trees':
            return next_to
        if A == 'Flowers' and B == 'Rocks':
            return next_to
        if A == 'Trees' and B == 'Car':
            return a - 1 == b
        if A == 'Gallchobhar' and B == 'Rugby':
            return a-1 == b

        if recurse == 0:
            return zebra_constraint(B, b, A, a, 1)
        if ((A in Names and B in Names) or
                (A in Sports and B in Sports) or
                (A in Transportation and B in Transportation) or
                (A in Lawns and B in Lawns)):
            return not same
        raise Exception('error')
    return CSP(variables, domains, neighbors, zebra_constraint)

print(backtracking_search(Bebra()))
