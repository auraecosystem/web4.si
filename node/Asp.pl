% Facts
edge(1, 2). edge(2, 3). edge(3, 4).

% Transitive Reachability Rules
reachable(X, Y) :- edge(X, Y).
reachable(X, Y) :- edge(X, Z), reachable(Z, Y).

% Output filter directive
#show reachable/2.
