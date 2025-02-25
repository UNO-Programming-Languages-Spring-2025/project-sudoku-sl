% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
num(1..4).
pos(1..4).
{ sudoku(X,Y,N) : num(N) } = 1 :- pos(X), pos(Y).
:- sudoku(X,Y,N), sudoku(X,Y2,N), Y != Y2.
:- sudoku(X,Y,N), sudoku(X2,Y,N), X != X2.
sudoku(X,Y,N) :- initial(X,Y,N).

#show sudoku/3.

