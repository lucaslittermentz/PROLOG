main :-
	%% Tempo inicial
    statistics(cputime,T1),

	festa(L1),
	mostralista(L1),

    %% Tempo final
    statistics(cputime, T2),
    Tempo_BUSCA is (T2 - T1),
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA).

mostralista([]).
mostralista([H|T]) :-
	write(H), nl,
	mostralista(T).


%% Regras do problema.

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
	%% Regras envolvendo vestido.

	mae(M1),
	mae(M2),
	mae(M3),
	mae(M4),
	mae(M5),

	tudodiferente([M1,M2,M3,M4,M5]),
	%% Regras envolvendo m�e.

	filho(F1),
	filho(F2),
	filho(F3),
	filho(F4),
	filho(F5),

	tudodiferente([F1,F2,F3,F4,F5]),
	%% Regras envolvendo filho.
	%% Luiz est� na terceira posi��o.
	F3==luiz,
	%% Luciana est� ao lado da m�e de Tales.
	((F1==tales,M2==luciana);
	(F2==tales,(M1==luciana;M3==luciana));
	(F3==tales,(M2==luciana;M4==luciana));
	(F4==tales,(M3==luciana;M5==luciana));
	(F5==tales,M4==luciana)),
	%% A m�e do Jos� est� em algum lugar � direita da mulher do vestido Verde.
	((V1==verde,(F2==jose;F3==jose;F4==jose;F5==jose));
	(V2==verde,(F3==jose;F4==jose;F5==jose));
	(V3==verde,(F4==jose;F5==jose));
	(V4==verde,F5==jose)),


	idade(I1),
	idade(I2),
	idade(I3),
	idade(I4),
	idade(I5),

	tudodiferente([I1,I2,I3,I4,I5]),
	%% Regras envolvendo idade
	%% O filho da Luciana tem 10 anos.
	((M1==luciana,I1==10);
	(M2==luciana,I2==10);
	(M3==luciana,I3==10);
	(M4==luciana,I4==10);
	(M5==luciana,I5==10)),

	comida(C1),
	comida(C2),
	comida(C3),
	comida(C4),
	comida(C5),

	tudodiferente([C1,C2,C3,C4,C5]),
	%% Regras envolvendo comida

	estado(E1),
	estado(E2),
	estado(E3),
	estado(E4),
	estado(E5),

	tudodiferente([E1,E2,E3,E4,E5]),
	%% Regras envolvendo estado
	%% A m�e que levou Suspiro para a festa nasceu no estado cuja capital � Macei�.
	%% ((C1==suspiro,E1==maceio);
	%% (C2==suspiro,E2==maceio);
	%% (C3==suspiro,E3==maceio);
	%% (C4==suspiro,E4==maceio);
	%% (C5==suspiro,E5==maceio)),
	%% Quem levou Cuzcuz est� na segunda posi��o.
	C2==cuzcuz,
	%% A m�e de Roberto levou Pamonha para a festa.
	%% ((F1==roberto,C1==pamonha);
	%% (F2==roberto,C2==pamonha);
	%% (F3==roberto,C3==pamonha);
	%% (F4==roberto,C4==pamonha);
	%% (F5==roberto,C5==pamonha)),


	

	%% A m�e do garoto mais velho est� em algum lugar � direita da mulher do vestido Azul.
	%% 

	%% A mulher do vestido Verde est� exatamente � esquerda da mulher que nasceu na Bahia.


	%% Roberto est� exatamente � direita de quem levou Suspiro para a festa.


	%% Valentina est� exatamente � esquerda de Eduarda.


	%% A mulher do vestido Azul est� ao lado da m�e do filho de 9 anos.


	%% Quem levou Arroz doce est� exatamente � esquerda da m�e que nasceu em Alagoas.


	%% A m�e do filho de 8 anos est� em algum lugar � direita da mulher do vestido Verde.


	%% A m�e de Francisco est� exatamente � esquerda da m�e de Luiz.


	%% A mulher do vestido Amarelo est� exatamente � esquerda da m�e do filho de 11 anos.


	%% F�tima est� ao lado da m�e que nasceu em Alagoas.


	%% A mulher que nasceu no Cear� est� exatamente � esquerda da mulher que nasceu no estado cuja capital � Aracaju.



	%% A mulher do vestido Vermelho est� ao lado da mulher que nasceu em Sergipe.


	%% A Valentina est� na terceira posi��o.
	%% M3==valentina,




	nl.


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


%% Regra para diferenciar atribui��es

tudodiferente([]).
tudodiferente([H|T]) :-
	not(member(H,T)),
	tudodiferente(T).