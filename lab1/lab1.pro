male(daniel).
male(victor).
male(oleg).
male(dumitru).
male(sergiu).
male(ion).
male(ilie).
male(mihail).
male(cornel).
male(andrei).

female(tamara).
female(larisa).
female(galina).
female(svetlana).
female(felicia).
female(mihaela).
female(rodica).
female(aurica).
female(mila).
female(corina).
female(olga).

parent(tamara, daniel).
parent(andrei, daniel).
parent(mila, dumitru).
parent(ion, dumitru).
parent(mila, sergiu).
parent(ion, sergiu).
parent(mila, cornel).
parent(ion, cornel).
parent(svetlana, felicia).
parent(mihail, felicia).
parent(svetlana, mihaela).
parent(mihail, felicia).
parent(galina, rodica).
parent(ilie, rodica).
parent(galina, aurica).
parent(ilie, aurica).
parent(mila, corina).
parent(ion, corina).
parent(sergiu, tamara).
parent(olga, tamara).
parent(sergiu, ion).
parent(olga, ion).
parent(sergiu, ilie).
parent(olga, ilie).
parent(sergiu, mihail).
parent(olga, mihail).


father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

brother(X, Y) :-
    male(X),
    sibling(X, Y).

sister(X, Y) :-
    female(X),
    sibling(X, Y).

parents(L, X) :-
    bagof(A, parent(A, X), L).

sibling(X, Y) :-
    bagof(A, parent(A, X), L1),
    bagof(B, parent(B, Y), L2),
    L1 == L2,
    not(X = Y).

uncle_or_aunt(X, Y) :-
    bagof(A, parent(A, Y), L3),
    bagof(B, sibling(B, X), L4),
    intersection(L3, L4, C),
    length(C, Le),
    Le > 0. 

uncle(X, Y) :-
    male(X),
    uncle_or_aunt(X, Y).

aunt(X, Y) :-
    female(X),
    uncle_or_aunt(X, Y).
    
grandparent(X, Y, [H|T]) :-
    var(H) -> parents(T, Y),
    parent(X, H),
    grandparent(X, Y, T).
    
    
