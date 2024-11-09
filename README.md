# Taller: Introducción al Paradigma Lógico

## Indice
- [**Ejercicio 1: Crear una Base de Hechos y Reglas**](#ejercicio-1-crear-una-base-de-hechos-y-reglas)
- [**Ejercicio 2: Consultas en Prolog**](#ejercicio-2-consultas-en-prolog)
- [**Ejercicio 3: Problema Práctico Clasificación de Animales**](#ejercicio-3-problema-práctico-clasificación-de-animales)
- [**Ejercicio 4: Creación de un Problema Propio usando el Paradigma Lógico**](#ejercicio-4-creación-de-un-problema-propio-usando-el-paradigma-lógico)

## Ejercicio 1: Crear una Base de Hechos y Reglas

[**Código Prolog:**](Paradigma_Logico/Taller.pl)

```prolog
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
```

**Consultas:**

```prolog
?- padre(darien, X).
?- abuelo(X, luis).
?- hermano(X, violet).
?- tio(X, luis).
```

## Ejercicio 2: Consultas en Prolog

Las siguientes consultas muestran las relaciones familiares definidas en el ejercicio 1:

```prolog
20 ?- padre(darien, X).         % Resultado: X = violet ; X = esteban.
21 ?- abuelo(X, luis).          % Resultado: X = darien.
23 ?- hermano(X, violet).       % Resultado: X = esteban.
25 ?- tio(X, luis).             % Resultado: X = esteban.
```

## Ejercicio 3: Problema Práctico Clasificación de Animales

[**Código Prolog:**](Paradigma_Logico/animales.pl)

```prolog
% Hechos
animal(aguila).
animal(colibri).
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
```

**Consultas:**

```prolog
36 ?- mamifero(X).              % Resultado: X = canguro ; X = leon.
39 ?- reptil(X).                % Resultado: X = cocodrilo ; X = camaleon.
40 ?- vuela(X).                 % Resultado: X = aguila ; X = colibri.
```

## Ejercicio 4: Creación de un Problema Propio usando el Paradigma Lógico

**Planteamiento del Problema:**
El sistema de conocimiento está diseñado para ayudar a un psicólogo a identificar posibles trastornos mentales basándose en los síntomas reportados por los pacientes y verificar la comorbilidad entre los diagnósticos. 

[**Código Prolog:**](Paradigma_Logico/psicologia.pl)

```prolog
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
```

**Consultas:**

```prolog
14 ?- tiene_trastorno(depresion, tristeza).      % Resultado: true.
16 ?- tiene_trastorno(X, tristeza).              % Resultado: X = depresion.
17 ?- tiene_comorbilidad(depresion, Y).          % Resultado: Y = ansiedad ; Y = fobia ; Y = bulimia.
20 ?- posible_diagnostico(X, [tristeza, anedonia]).  % Resultado: X = depresion.
```

## Propósito y Aplicación en un Contexto Real

**Propósito:** Este sistema permite a los psicólogos estructurar el diagnóstico inicial de trastornos mentales, proporcionando una base rápida para identificar patrones de síntomas específicos y comorbilidades, lo cual es útil en contextos con recursos limitados o en consultas preliminares.

**Aplicación:** En un entorno clínico, el sistema puede usarse como herramienta de apoyo en consultas preliminares, ayudando a identificar trastornos comunes y comorbilidades. También puede ser útil en investigaciones académicas para analizar la relación entre síntomas y trastornos en grandes grupos de pacientes.

---
