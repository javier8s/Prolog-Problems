arc(n3201abajo,n3300arriba).
arc(n3300arriba,n3201abajo).
arc(n3300arriba,n2211abajo).
arc(n2211abajo,n3300arriba).
arc(n2211abajo,n3201arriba).
arc(n3201arriba,n2211abajo).
arc(n3201arriba,n3102abajo).
arc(n3102abajo,n3201arriba).
arc(n3102abajo,n3300arriba).
arc(n3300arriba,n3102abajo).
arc(n3201arriba,n3003abajo).
arc(n3003abajo,n3201arriba).
arc(n3003abajo,n3102arriba).
arc(n3102arriba,n3003abajo).
arc(n3102arriba,n1122abajo).
arc(n1122abajo,n3102arriba).
arc(n1122abajo,n2211arriba).
arc(n2211arriba,n1122abajo).
arc(n2211arriba,n0231abajo).
arc(n0231abajo,n2211arriba).
arc(n0231abajo,n0330arriba).
arc(n0330arriba,n0231abajo).
arc(n0330arriba,n0132abajo).
arc(n0132abajo,n0330arriba).
arc(n0132abajo,n1122arriba).
arc(n1122arriba,n0132abajo).
arc(n0132abajo,n0231arriba).
arc(n0231arriba,n0132abajo).
arc(n0231arriba,n0033abajo).
arc(n0033abajo,n0231arriba).
meta(n0033abajo).


depth_first_search_alt(Start, GoalPred, Meta) :- retractall(marked( _ )), asserta(marked(Start)), dfs_alt(Start, GoalPred, Sol), !, retractall(marked( _ )).
depth_first_search_alt( _ , _ , _ ) :- retractall(marked( _ )),fail.
dfs_alt(Node, GoalPred, [Node]) :- Goal =.. [GoalPred,Node], Goal.
dfs_alt(Node, Goal, [Node | Path]):- arc(Node, Next), unmarked(Next), dfs_alt(Next, Goal, Path).
unmarked(Node):- not(marked(Node)), assert(marked(Node)).
append( [], X, X ).
append( [X|Y], Z, [X|W]) :- append( Y, Z, W ).
member( X, [X|_] ).
member( X, [_|Y] ) :- member( X, Y ).







