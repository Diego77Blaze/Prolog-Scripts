% Autor:
% Fecha: 13/02/2020

%Nombre Vida Daño
%Soldados se atacan entre sí
%Lista con todos los solodados
%Elegir soldado atacante y soldado defensor
%Modificar la vida del defensor tras el ataque
%Vida <= 0 --> Sacar soldado de la lista
%Lista.size = 1 --> Terminar
%Mostrar mensajes de la situación

soldado(['john',15,1]).
soldado(['peter',10,2]).
soldado(['ryan',5,3]).

%Sacar valor aleatorio --> random(2,9,X).

crear_lista(ListaAux, ListaOut):-
     soldado(X),
     \+(member(X, ListaAux)), !,
     append(ListaAux, [X], ListaAux2),
     crear_lista(ListaAux2, ListaOut).

crear_lista(ListaOut, ListaOut).

atacar(Atacante,Defensor,DefensorOut):-
     Atacante=[NAtacante,VAtacante,DAtacante],
     Defensor=[NDefensor,VDefensor,DDefensor],
     VDefensorOut is VDefensor - DAtacante,
     DefensorOut = [NDefensor, VDefensorOut, DDefensor].

select_atacante_defensor(ListaSoldados, DatosAtacante, DatosDefensor):-
    repeat,
    random(0,2,NumAtacante), random(0,2,NumDefensor), \+ (NumAtacante = NumDefensor)
