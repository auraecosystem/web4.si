# Find a single valid solution for an 8x8 board
clingo nqueens.lp

# Find ALL solutions for an 8x8 board (returns 92 models)
clingo nqueens.lp 0

# Override board size to 12x12
clingo nqueens.lp -c n=12
