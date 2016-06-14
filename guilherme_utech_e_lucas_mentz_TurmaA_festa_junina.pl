/*
Alunos: Guilherme Roberto Utech e Lucas Litter Mentz

Sa�da:

1 ?- main.

vermelho,isabela,joao,7,pedemoleque,ceara
verde,luciane,robson,10,cuzcuz,sergipe
azul,adelaide,luis,8,arrozdoce,bahia
amarelo,roberta,paulo,9,suspiro,alagoas
branco,gabriela,mario,11,pamonha,paraiba

 T1: 0.046875    T2: 3.312500  msec
 Tempo total: 3.2656250000  msec
true ;
false.

*/

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
	(V5,M5,F5,I5,C5,E5) ]) :-


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
	%% A Adelaide (Valentina) est� na terceira posi��o.
	M3==adelaide,
	%% Adelaide (Valentina) est� exatamente � esquerda de Roberta (Eduarda).
	((M1==adelaide,M2==roberta);
	(M2==adelaide,M3==roberta);
	(M3==adelaide,M4==roberta);
	(M4==adelaide,M5==roberta)),


	filho(F1),
	filho(F2),
	filho(F3),
	filho(F4),
	filho(F5),

	tudodiferente([F1,F2,F3,F4,F5]),
	%% Regras envolvendo filho.
	%% Luis (Luiz) est� na terceira posi��o.
	F3==luis,
	%% A m�o de Robson (Francisco) est� exatamente � esquerda da m�e de Luis (Luiz).
	((F1==robson,F2==luis);
	(F2==robson,F3==luis);
	(F3==robson,F4==luis);
	(F4==robson,F5==luis)),
	%% Luciane (Luciana) est� ao lado da m�e de Joao (Tales).
	((F1==joao,M2==luciane);
	(F2==joao,(M1==luciane;M3==luciane));
	(F3==joao,(M2==luciane;M4==luciane));
	(F4==joao,(M3==luciane;M5==luciane));
	(F5==joao,M4==luciane)),
	%% A m�e do Paulo (Jos�) est� em algum lugar � direita da mulher do vestido Verde.
	((V1==verde,(F2==paulo;F3==paulo;F4==paulo;F5==paulo));
	(V2==verde,(F3==paulo;F4==paulo;F5==paulo));
	(V3==verde,(F4==paulo;F5==paulo));
	(V4==verde,F5==paulo)),


	idade(I1),
	idade(I2),
	idade(I3),
	idade(I4),
	idade(I5),

	tudodiferente([I1,I2,I3,I4,I5]),
	%% Regras envolvendo idade
	%% A m�e do filho de 8 anos est� em algum lugar � direita da mulher do vestido Verde.
	((V1==verde,(I2==8;I3==8;I4==8;I5==8));
	(V2==verde,(I3==8;I4==8;I5==8));
	(V3==verde,(I4==8;I5==8));
	(V4==verde,I5==8)),
	%% A m�e do garoto mais velho est� em algum lugar � direita da mulher do vestido Azul.
	((V1==azul,(I2==11;I3==11;I4==11;I5==11));
	(V2==azul,(I3==11;I4==11;I5==11));
	(V3==azul,(I4==11;I5==11));
	(V4==azul,I5==11)),
	%% A mulher do vestido Amarelo est� exatamente � esquerda da m�e do filho de 11 anos.
	((V1==amarelo,I2==11);
	(V2==amarelo,I3==11);
	(V3==amarelo,I4==11);
	(V4==amarelo,I5==11)),
	%% A mulher do vestido Azul est� ao lado da m�e do filho de 9 anos.
	((I1==9,V2==azul);
	(I2==9,(V1==azul;V3==azul));
	(I3==9,(V2==azul;V4==azul));
	(I4==9,(V3==azul;V5==azul));
	(I5==9,V4==azul)),
	%% O filho da Luciane (Luciana) tem 10 anos.
	((M1==luciane,I1==10);
	(M2==luciane,I2==10);
	(M3==luciane,I3==10);
	(M4==luciane,I4==10);
	(M5==luciane,I5==10)),


	comida(C1),
	comida(C2),
	comida(C3),
	comida(C4),
	comida(C5),

	tudodiferente([C1,C2,C3,C4,C5]),
	%% Regras envolvendo comida
	%% Quem levou Cuzcuz est� na segunda posi��o.
	C2==cuzcuz,
	%% A m�e de Mario (Roberto) levou Pamonha para a festa.
	((F1==mario,C1==pamonha);
	(F2==mario,C2==pamonha);
	(F3==mario,C3==pamonha);
	(F4==mario,C4==pamonha);
	(F5==mario,C5==pamonha)),
	%% Mario (Roberto) est� exatamente � direita de quem levou Suspiro para a festa.
	((C1==suspiro,F2==mario);
	(C2==suspiro,F3==mario);
	(C3==suspiro,F4==mario);
	(C4==suspiro,F5==mario)),


	estado(E1),
	estado(E2),
	estado(E3),
	estado(E4),
	estado(E5),

	tudodiferente([E1,E2,E3,E4,E5]),
	%% Regras envolvendo estado
	%% A mulher do vestido Verde est� exatamente � esquerda da mulher que nasceu na Bahia.
	((V1==verde,E2==bahia);
	(V2==verde,E3==bahia);
	(V3==verde,E4==bahia);
	(V4==verde,E5==bahia)),
	%% A mulher do vestido Vermelho est� ao lado da mulher que nasceu em Sergipe.
	((E1==sergipe,V2==vermelho);
	(E2==sergipe,(V1==vermelho;V3==vermelho));
	(E3==sergipe,(V2==vermelho;V4==vermelho));
	(E4==sergipe,(V3==vermelho;V5==vermelho));
	(E5==sergipe,V4==vermelho)),
	%% Gabriela (F�tima) est� ao lado da m�e que nasceu em Alagoas.
	((E1==alagoas,M2==gabriela);
	(E2==alagoas,(M1==gabriela;M3==gabriela));
	(E3==alagoas,(M2==gabriela;M4==gabriela));
	(E4==alagoas,(M3==gabriela;M5==gabriela));
	(E5==alagoas,M4==gabriela)),
	%% A mulher que nasceu no Cear� est� exatamente � esquerda da mulher que nasceu no estado cuja capital � Aracaju.
	((E1==ceara,E2==sergipe);
	(E2==ceara,E3==sergipe);
	(E3==ceara,E4==sergipe);
	(E4==ceara,E5==sergipe)),
	%% Quem levou Arroz doce est� exatamente � esquerda da m�e que nasceu em Alagoas.
	((C1==arrozdoce,E2==alagoas);
	(C2==arrozdoce,E3==alagoas);
	(C3==arrozdoce,E4==alagoas);
	(C4==arrozdoce,E5==alagoas)),
	%% A m�e que levou Suspiro para a festa nasceu no estado cuja capital � Macei�.
	((C1==suspiro,E1==alagoas);
	(C2==suspiro,E2==alagoas);
	(C3==suspiro,E3==alagoas);
	(C4==suspiro,E4==alagoas);
	(C5==suspiro,E5==alagoas)),

	nl.


% Declara��o de valores

vestido(amarelo).
vestido(azul).
vestido(branco).
vestido(verde).
vestido(vermelho).

mae(roberta). %% eduarda
mae(gabriela). %% fatima
mae(luciane). %% luciana
mae(isabela). %% maria
mae(adelaide). %% valentina

filho(robson). %% francisco
filho(paulo). %% jose
filho(luis). %% luiz
filho(mario). %% roberto
filho(joao). %% tales

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