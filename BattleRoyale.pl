% Autor:
% Fecha: 13/02/2020

%Soldados se atacan entre sí
%Lista de todos los soldados
%Elegir soldado atacante y soldado receptor
%Moificar la vida del defensor tras el ataque
%Vida <= 0--> sacar al soldado de la lista
%lista.suze = 1 --> Winner winner chicken dinner Victoria Royale
%Mostrar mensajes de la situacion


%Nombre Vida Daño
soldado(['john',15,1]).
soldado(['peter',10,2]).
soldado(['ryan',5,3]).

crear_lista(ListaAux, ListaOut):-
    soldado(X),
    \+(member(X, ListaAux)), !,
    append(ListaAux, [X], ListaAux2),
    crear_lista(ListaAux2,ListaOut).
crear_lista(ListaOut ,ListaOut).

atacar(Atacante,Defensor,DefensorOut):-
    Atacante[NAtacante,VAtacante,DAtacante],
    Defensor=[NDefensor,VDefensor,DDefensor],
    substract(VDefensor, DAtacante, VDefensorOut),
    DefensorOut=[NDefensor,VDefensorOut,DDefensor].