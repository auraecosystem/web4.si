% Input Graph Data
node(1..4).
color(red; green; blue).
edge(1,2). edge(2,3). edge(3,4). edge(4,1).

% Symmetric edges (undirected graph)
edge(Y, X) :- edge(X, Y).

% 1. GENERATE: Assign exactly 1 color to each node
1 { assign_color(N, C) : color(C) } 1 :- node(N).

% 2. TEST (Constraint): No two adjacent nodes may share the same color
:- edge(U, V), assign_color(U, C), assign_color(V, C).

#show assign_color/2.
