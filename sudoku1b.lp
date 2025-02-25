% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
num(1..4).
pos(1..4).


1 { sudoku(X,Y,N) : num(N) } 1 :- pos(X), pos(Y).
:- pos(Y), num(N), not 1 { sudoku(X,Y,N) } 1.
:- pos(X), num(N), not 1 { sudoku(X,Y,N) } 1.
sudoku(X,Y,N) :- initial(X,Y,N).


subgrid(X,Y,1) :- pos(X), pos(Y), X <= 2, Y <= 2.
subgrid(X,Y,2) :- pos(X), pos(Y), X <= 2, Y > 2.
subgrid(X,Y,3) :- pos(X), pos(Y), X > 2, Y <= 2.
subgrid(X,Y,4) :- pos(X), pos(Y), X > 2, Y > 2.

#show sudoku/3.
#show subgrid/3.

