% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
num(1..9).
pos(1..9).



1 { sudoku(X,Y,N) : num(N) } 1 :- pos(X), pos(Y).
:- pos(Y), num(N), not 1 { sudoku(X,Y,N) } 1.
:- pos(X), num(N), not 1 { sudoku(X,Y,N) } 1.
sudoku(X,Y,N) :- initial(X,Y,N).

subgrid(X,Y,1) :- pos(X), pos(Y), X <= 3, Y <= 3.
subgrid(X,Y,2) :- pos(X), pos(Y), X <= 3, Y > 3, Y <= 6.
subgrid(X,Y,3) :- pos(X), pos(Y), X <= 3, Y > 6.

subgrid(X,Y,4) :- pos(X), pos(Y), X > 3, X <= 6, Y <= 3.
subgrid(X,Y,5) :- pos(X), pos(Y), X > 3, X <= 6, Y > 3, Y <= 6.
subgrid(X,Y,6) :- pos(X), pos(Y), X > 3, X <= 6, Y > 6.

subgrid(X,Y,7) :- pos(X), pos(Y), X > 6, Y <= 3.
subgrid(X,Y,8) :- pos(X), pos(Y), X > 6, Y > 3, Y <= 6.
subgrid(X,Y,9) :- pos(X), pos(Y), X > 6, Y > 6.


:- num(N), subgrid(_,_,G), not 1 { sudoku(X,Y,N) : subgrid(X,Y,G) } 1.

#show sudoku/3.


