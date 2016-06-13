main :- true.

mostralista([]).
mostralista([H|T]) :-
	write(H), nl,
	mostralista(T).


% Declara��o de valores

vestido(amarelo).
vestido(azul).
vestido(branco).
vestido(verde).
vestido(vermelho).

mae(eduarda).
mae(fatima).
mae(luciana).
mae(maria).
mae(valentina).

filho(francisco).
filho(jose).
filho(luiz).
filho(roberto).
filho(tales).

idade(7).
idade(8).
idade(9).
idade(10).
idade(11).

comida(arrozdoce).
comida(cuzcuz).
comida(pamonha).
comida(pedemoleque).
comida(suspiro).

estado(alagoas).
estado(bahia).
estado(ceara).
estado(paraiba).
estado(sergipe).

tudodiferente([]).
tudodiferente([H|T]) :-
	not(member(H,T)),
	tudodiferente(T).

festa([ (V1,M1,F1,I1,C1,E1),
	(V2,M2,F2,I2,C2,E2),
	(V3,M3,F3,I3,C3,E3),
	(V4,M4,F4,I4,C4,E4),
	(V5,M5,F5,I5,C5,E5) ]):-


	vestido(V1),
	vestido(V2),
	vestido(V3),
	vestido(V4),
	vestido(V5),

	tudodiferente([V1,V2,V3,V4,V5]),


	mae(M1),
	mae(M2),
	mae(M3),
	mae(M4),
	mae(M5),

	tudodiferente([M1,M2,M3,M4,M5]),


	filho(F1),
	filho(F2),
	filho(F3),
	filho(F4),
	filho(F5),

	tudodiferente([F1,F2,F3,F4,F5]),


	idade(I1),
	idade(I2),
	idade(I3),
	idade(I4),
	idade(I5),

	tudodiferente([I1,I2,I3,I4,I5]),


	comida(C1),
	comida(C2),
	comida(C3),
	comida(C4),
	comida(C5),

	tudodiferente([C1,C2,C3,C4,C5]),


	estado(E1),
	estado(E2),
	estado(E3),
	estado(E4),
	estado(E5),

	tudodiferente([E1,E2,E3,E4,E5]),


/*
% A m�e que levou Suspiro para a festa nasceu no estado cuja capital �
% Macei�.

% A m�e do garoto mais velho est� em algum lugar � direita da mulher do
% vestido Azul.

% Luiz est� na terceira posi��o.

% Luciana est� ao lado da m�e de Tales.

% A mulher do vestido Verde est� exatamente � esquerda da mulher que
% nasceu na Bahia.

% Quem levou Cuzcuz est� na segunda posi��o.

% O filho da Luciana tem 10 anos.

% Roberto est� exatamente � direita de quem levou Suspiro para a festa.

% Valentina est� exatamente � esquerda de Eduarda.

% A mulher do vestido Azul est� ao lado da m�e do filho de 9 anos.

% Quem levou Arroz doce est� exatamente � esquerda da m�e que nasceu em
% Alagoas.

% A m�e do filho de 8 anos est� em algum lugar � direita da mulher do
% vestido Verde.

% A m�o de Francisco est� exatamente � esquerda da m�e de Luiz.

% A mulher do vestido Amarelo est� exatamente � esquerda da m�e do filho
% de 11 anos.

% F�tima est� ao lado da m�e que nasceu em Alagoas.

% A mulher que nasceu no Cear� est� exatamente � esquerda da mulher que
% nasceu no estado cuja capital � Aracaju.

% A m�e de Roberto levou Pamonha para a festa.

% A mulher do vestido Vermelho est� ao lado da mulher que nasceu em
% Sergipe.

% A Valentina est� na terceira posi��o.

% A m�e do Jos� est� em algum lugar � direita da mulher do vestido
% Verde.
*/

nl.






