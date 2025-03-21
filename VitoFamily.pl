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


descendiente(Padre,Desc):-progenitor(Padre,Desc).
descendiente(Padre,Desc):-progenitor(Padre,Hijo),descendiente(Hijo,Desc).

descendientes(X):- append([],[X],ListaConVito),descendientesaux(X,ListaConVito).
descendientesaux(X,ListaDescendientes):-
   descendiente(X,Z),
   not(member(Z,ListaDescendientes)),!,
   append(ListaDescendientes,[Z],ListaDescendientesFinal),
   descendientesaux(X,ListaDescendientesFinal).
descendientesaux(_,ListaDescendientes):-writeln(ListaDescendientes).


hermano(X, Y):-progenitor(Z,X),progenitor(Z,Y), \+ (X=Y).
abuelo(X,Y):-progenitor(X,Z),progenitor(Z,Y).
nieto(Y,X):-progenitor(X,Z),progenitor(Z,Y).
tio(X,Y):-hermano(X,Z),progenitor(Z,Y).
sobrino(Y,X):-hermano(X,Z),progenitor(Z,Y).

relacionaux(Relacion):- (Relacion = ancestro).
relacionaux(Relacion):- (Relacion = progenitor).
relacionaux(Relacion):- (Relacion = abuelo).
relacionaux(Relacion):- (Relacion = nieto).
relacionaux(Relacion):- (Relacion = tio).
relacionaux(Relacion):- (Relacion = sobrino).



relacion(X,Y,Relacion):- relacionaux(Relacion),call(Relacion,X,Y).

hermanos(Persona, ListaAux, ListaHermanos):-  %PROBAR CON hermanos(michael,[],X).
   hermano(Persona,Hermano),
   \+ member(Hermano,ListaAux), !,
   append(ListaAux,[Hermano],ListaAux2),
   hermanos(Persona,ListaAux2,ListaHermanos).
hermanos(_,ListaHermanos,ListaHermanos).


pedir_numero(Min,Max,Out):-
    repeat,
    write('Introduce un numero entre '),
    write(Min),write(' y '),write(Max),writeln(':'),
    read(Out),
    ((Out >= Min, Out =< Max,!);
    writeln('Dato Incorrecto'), false).%la cortadura es la que para el repeat cuando sea verdadero.


simbolos([a,b,c,b,a]).
listasdelistas([[q,w,e,r],[a,s,d,f],[z,x,c,v]]).
reemplazar_simbolo_lista(Lista,IndiceSubLista,ValorOriginal,ValorNuevo,ListaOut):-
   nth1(IndiceSubLista,Lista,Sublista,Res),
   select(ValorOri,Sublista,ValorNuevo,SubListaout),
   nth1(IndiceSubLista,ListaOut,SubListaout,Res).







