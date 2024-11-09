% Hechos
padre(darien, violet).
padre(darien, esteban).
madre(valeria, violet).
madre(valeria, esteban).

padre(violet, luis).
padre(esteban, sofia).

hermano(violet, esteban).
hermano(esteban, violet).

% Reglas
abuelo(X, Y) :- padre(X, Z), padre(Z, Y).
tio(X, Y) :- hermano(X, Z), padre(Z, Y).