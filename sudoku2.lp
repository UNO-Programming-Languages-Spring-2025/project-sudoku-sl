% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
numbers(N) :- N = 1..9.
subgrid_positions(P) :- P = 1..9.

validCells(X,Y,N) :- subgrid_positions(X), subgrid_positions(Y), numbers(N).
1 { cellValue(X,Y,N) : numbers(N) } 1 :- subgrid_positions(X), subgrid_positions(Y).


cellValue(X,Y,N) :- initial(X,Y,N).

in_row(X,N) :- cellValue(X,Y,N), subgrid_positions(Y).
:- numbers(N), subgrid_positions(X), not in_row(X,N).
in_col(Y,N) :- cellValue(X,Y,N), subgrid_positions(X).
:- numbers(N), subgrid_positions(Y), not in_col(Y,N).

subgrid(X,Y,1) :- subgrid_positions(X), subgrid_positions(Y), X <= 3, Y <= 3.
subgrid(X,Y,2) :- subgrid_positions(X), subgrid_positions(Y), X <= 3, Y > 3, Y <= 6.
subgrid(X,Y,3) :- subgrid_positions(X), subgrid_positions(Y), X <= 3, Y > 6.
subgrid(X,Y,4) :- subgrid_positions(X), subgrid_positions(Y), X > 3, X <= 6, Y <= 3.
subgrid(X,Y,5) :- subgrid_positions(X), subgrid_positions(Y), X > 3, X <= 6, Y > 3, Y <= 6.
subgrid(X,Y,6) :- subgrid_positions(X), subgrid_positions(Y), X > 3, X <= 6, Y > 6.
subgrid(X,Y,7) :- subgrid_positions(X), subgrid_positions(Y), X > 6, Y <= 3.
subgrid(X,Y,8) :- subgrid_positions(X), subgrid_positions(Y), X > 6, Y > 3, Y <= 6.
subgrid(X,Y,9) :- subgrid_positions(X), subgrid_positions(Y), X > 6, Y > 6.

inSubgrid(G,N) :- cellValue(X,Y,N), subgrid(X,Y,G).
:- numbers(N), G = 1..9, not inSubgrid(G,N).

sudoku(X,Y,N) :- cellValue(X,Y,N).

#show sudoku/3.


