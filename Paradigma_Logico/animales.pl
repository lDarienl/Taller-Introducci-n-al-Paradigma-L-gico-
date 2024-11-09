% Hechos
animal(aguila).
animal(colibri)
animal(espada).
animal(payaso).
animal(cocodrilo).
animal(camaleon).
animal(leon).
animal(canguro).
animal(sapo).
animal(ajolote).

mamifero(canguro).
mamifero(leon).
ave(aguila).
ave(colibri).
reptil(cocodrilo).
reptil(camaleon).
pez(payaso).
pez(espada).
anfibio(sapo).
anfibio(ajolote).

% Reglas
vuela(X) :- ave(X).
nada(X) :- pez(X).
viviparos(X) :- mamifero(X).
sangrefria(X) :- reptil(X).
glandulasmucosas(X) :- anfibio(X).
