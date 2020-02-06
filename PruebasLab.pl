% Autor:
% Fecha: 30/01/2020

personas([adrian,manuel,pablo,enrique,yolanda,esther]).

padre(adrian, manuel).
padre(alberto, pablo).
padre(lucas,pablo).
padre(enrique,pablo).
madre(julio, yolanda).
madre(adrian, yolanda).
madre(alberto, esther).
hermano(Her1,Her2):- padre(Her1,Padre),padre(Her2,Padre),\+ (Her1=Her2).
hermano(Her1,Her2):- madre(Her1,Madre),madre(Her2,Madre),\+ (Her1=Her2).
ancestro(Ancestro,Sucesor):- padre(Sucesor, Ancestro);madre(Sucesor, Ancestro);ancestro(%hijos del ancestro, el mismo)

imprimir_personas([Pers1|OtrasPersonas]):-writeln(Pers1),imprimir_personas(OtrasPersonas).
imprimir_personas([]). %Regla final de condicion de parada

sumar_1(ListaNums, Resultados):-sumar_1_aux(ListaNums,[],Resultados).
sumar_1_aux(ListaNums,ResAux,Resultados):-
     ListaNums=[Num|MasNums],
     NuevoNum is (Num+1),
     append(ResAux,[NuevoNum],ResAux2),
     sumar_1_aux(MasNums,ResAux2,Resultados).
sumar_1_aux([].Resultados,Resultados).
sumar_1([]). %Regla final de condicion de parada


