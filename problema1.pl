main :- 
	%% Tempo inicial
    statistics(cputime,T1),
 
	resol([ (B1, N1, L1, P1, I1, J1),
			(B2, N2, L2, P2, I2, J2),
			(B3, N3, L3, P3, I3, J3),
			(B4, N4, L4, P4, I4, J4),
			(B5, N5, L5, P5, I5, J5) ]),
 
 
    %% Tempo final
    statistics(cputime, T2), 
    Tempo_BUSCA is (T2 - T1), 
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA).





resol([ (B1, N1, L1, P1, I1, J1),
		(B2, N2, L2, P2, I2, J2),
		(B3, N3, L3, P3, I3, J3),
		(B4, N4, L4, P4, I4, J4),
		(B5, N5, L5, P5, I5, J5) ]) :- 
			
			bolsa(B1),
			bolsa(B2),
			bolsa(B3),
			bolsa(B4),
			bolsa(B5),
			
			nome(N1),
			nome(N2),
			nome(N3),
			nome(N4),
			nome(N5),
			
			livro(L1),
			livro(L2),
			livro(L3),
			livro(L4),
			livro(L5),
			
			preco(P1),
			preco(P2),
			preco(P3),
			preco(P4),
			preco(P5),
			
			idade(I1),
			idade(I2),
			idade(I3),
			idade(I4),
			idade(I5),
			
			job(J1),
			job(J2),
			job(J3),
			job(J4),
			job(J5),
			
			naoigual( [B1,B2,B3,B4,B5] ),
			naoigual( [N1,N2,N3,N4,N5] ),
			naoigual( [L1,L2,L3,L4,L5] ),
			naoigual( [P1,P2,P3,P4,P5] ),
			naoigual( [J1,J2,J3,J4,J5] ),
			
			%% A cliente mais nova está em uma das pontas
			
			/*(I1==29; I5==29),
			
			%% Viviane está ao lado da mulher da bolsa amarela.
			
			((B1==amarela,N2==viviane);
			(B2==amarela,(N1==viviane;N3==viviane));
			(B3==amarela,(N2==viviane;N4==viviane));
			(B4==amarela,(N3==viviane;N5==viviane));
			(B5==amarela,N4==viviane)),
			
			%% Quem comprará o livro mais caro está em algum lugar entre quem escolheu o livro de animais e quem gastará R$30, nessa ordem
			
			((L1==animais,(P2==35;P3==35;P4==35),P5==30);
			(L2==animais,(P3==35;P4==35),P5==30);
			(L3==animais,P4==35,P5==30);
			(L1==animais,(P2==35;P3==35),P4==30);
			(L2==animais,P3==35,P4==30);
			(L1==animais,P2==35,P3==30)),
			
			%% A bióloga está em uma das pontas.
			
			(J1==biologa;J5==biologa),
			
			%% A dona da bolsa Branca está em algum lugar entre a dona da bolsa verde e a Luana, nessa ordem.
			
			((B1==verde,(B2==branca;B3==branca;B4==branca),N5==luana);
			(B2==verde,(B3==branca;B4==branca),N5==luana);
			(B3==verde,B4==branca,N5==luana);
			(B1==verde,(B2==branca;B3==branca),N4==luana);
			(B2==verde,B3==branca,N4==luana);
			(B1==verde,B2==branca,N3==luana)),
			
			%% A Editora está em uma das pontas.
			
			(J1==editora;J5==editora),
			
			%% Marcela está usando uma bolsa Branca.
			
			((N1==marcela,B1==branca);
			(N2==marcela,B2==branca);
			(N3==marcela,B3==branca);
			(N4==marcela,B4==branca);
			(N5==marcela,B5==branca)),
			
			%% Na primeira posição está a mulher que vai comprar o livro de colorir de Natureza.

			L1==natureza,
					
			%% Quem gastará R$ 20 está em algum lugar entre quem gastará R$ 25 e quem gastará R$ 15, nessa ordem.
			
			((P1==25,(P2==20;P3==20;P4==20),P5==15);
			(P2==25,(P3==20;P4==20),P5==15);
			(P3==25,P4==20,P5==15);
			(P1==25,(P2==20;P3==20),P4==15);
			(P2==25,P3==20,P4==15);
			(P1==25,P2==20,P3==15)),
			
			%% A dona da bolsa Azul está exatamente à esquerda da mulher de 36 anos.
			
			((B1==azul,I2==36);
			(B2==azul,I3==36);
			(B3==azul,I4==36);
			(B4==azul,I5==36)),
			
			%% Em uma das pontas está a mulher que vai comprar o livro de colorir de Gatos.
			
			(L1==gatos;L5==gatos),
			
			%% A Professora está na quarta posição.
			
			J4==professora,
			
			%% A mulher de 48 anos está em algum lugar entre a Bióloga e a mulher de 43 anos, nessa ordem.
			
			((J1==biologa,(I2==48;I3==48;I4==48),I5==43);
			(J2==biologa,(I3==48;I4==48),I5==43);
			(J3==biologa,I4==48,I5==43);
			(J1==biologa,(I2==48;I3==48),I4==43);
			(J2==biologa,I3==48,I4==43);
			(J1==biologa,I2==48,I3==43)),
			
			%% Renata está ao lado da mulher que vai comprar o livro de colorir de Natureza.
			
			N2==renata,
			
			%% Na segunda posição está a mulher que comprará o livro de colorir de Mandalas.
			
			L2==mandalas,
			
			%% A dona da bolsa Amarela está em algum lugar entre a mulher mais velha e a Socióloga, nessa ordem.
			
			((I1==55,(B2==amarela;B3==amarela;B4==amarela),J5==sociologa);
			(I2==55,(B3==amarela;B4==amarela),J5==sociologa);
			(I3==55,B4==amarela,J5==sociologa);
			(I1==55,(B2==amarela;B3==amarela),J4==sociologa);
			(I2==55,B3==amarela,J4==sociologa);
			(I1==55,B2==amarela,J3==sociologa)),
						
			%% A mulher que comprará o livro de colorir de R$ 25 está em uma das pontas.
			
			(P1==25;P5==25),
			
			%% A Delegada está na segunda posição.
			
			J2==delegada,
			
			%% Ângela está em algum lugar entre a Delegada e a mulher de 36 anos, nessa ordem.
			
			N3==angela,
			
			%% A mulher de 36 anos está na quarta posição.
			
			I4==36,
			
			
			*/nl.
		
naoigual( [ ] ).
naoigual( [H|T] ) :-
	not(member(H,T)),
	naoigual(T).
	

bolsa(amarela).
bolsa(azul).
bolsa(branca).
bolsa(verde).
bolsa(vermelha).

nome(angela).
nome(luana).
nome(marcela).
nome(renata).
nome(viviane).

livro(animais).
livro(flores).
livro(gatos).
livro(mandalas).
livro(natureza).

preco(15).
preco(20).
preco(25).
preco(30).
preco(35).

idade(29).
idade(36).
idade(43).
idade(48).
idade(55).

%% Profissão (Job para facilitar nomeacao das variaveis)

job(biologa).
job(delegada).
job(editora).
job(professora).
job(sociologa).
