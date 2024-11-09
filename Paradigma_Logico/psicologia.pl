% Hechos
trastorno(depresion).
trastorno(ansiedad).
trastorno(tdah).
trastorno(bulimia).
trastorno(fobia).
trastorno(anorexia).

% Síntomas asociados
sintoma(depresion, tristeza).
sintoma(depresion, anedonia).
sintoma(depresion, asocial).
sintoma(ansiedad, preocupacion).
sintoma(ansiedad, inquietud).
sintoma(ansiedad, tension).
sintoma(tdah, distraccion).
sintoma(tdah, impulsividad).
sintoma(tdah, impaciencia).
sintoma(bulimia, compensacion).
sintoma(bulimia, gula).
sintoma(bulimia, ocultamiento).
sintoma(fobia, miedo).
sintoma(fobia, sudoracion).
sintoma(fobia, nerviosismo).

% Comorbilidades
comorbido(depresion, ansiedad).
comorbido(ansiedad, bulimia).
comorbido(tdah, ansiedad).
comorbido(fobia, ansiedad).
comorbido(fobia, depresion).
comorbido(bulimia, depresion).

% Reglas
tiene_trastorno(X, Y) :- sintoma(X, Y).
tiene_comorbilidad(X, Y) :- comorbido(X, Y); comorbido(Y, X).
posible_diagnostico(X, [Y, Z]) :- sintoma(X, Y), sintoma(X, Z).