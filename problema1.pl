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
			
			
			nl.
		
naoigual( [ ] ) :- true.
naoigual( [H|T] ) :-
	not(member(H,T)),
	naoigual(T).
