% Autor:
% Fecha: 05/02/2020

hombre(antonio).
hombre(vito).
hombre(michael).
hombre(santino).
hombre(fredo).
hombre(tom).
hombre(carlo).
hombre(anthony).
hombre(vincent).
hombre(andrew).
mujer(madrevito).
mujer(carmella).
mujer(connie).
mujer(kay).
mujer(apollonia).
mujer(lucy).
mujer(sandra).
mujer(deanna).
mujer(theresa).
mujer(mary).

progenitor_de(antonio, vito).
progenitor_de(madrevito, vito).
progenitor_de(vito, michael).
progenitor_de(carmella, michael).
progenitor_de(vito, santino).
progenitor_de(carmella, santino).
progenitor_de(vito, connie).
progenitor_de(carmella, connie).
progenitor_de(vito, fredo).
progenitor_de(carmella, fredo).
progenitor_de(vito, tom).
progenitor_de(carmella, tom).
progenitor_de(michael,anthony).
progenitor_de(kay, anthony).
progenitor_de(michael, mary).
progenitor_de(kay, mary).
progenitor_de(santino, vincent).
progenitor_de(lucy, vincent).
progenitor_de(tom, andrew).
progenitor_de(theresa, andrew).

progenitor(Progenitor, Hijo):- progenitor_de(Progenitor,Hijo).
ancestro(X, Y):-progenitor(Y,X).
ancestro(X, Y):-progenitor(Y,Z),ancestro(X,Z).

descendientes(X,Y):-









