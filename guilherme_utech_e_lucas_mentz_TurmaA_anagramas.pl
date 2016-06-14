/*
Alunos: Guilherme Roberto Utech e Lucas Litter Mentz

Saída:

1 ?- main.
[...]
rdocaoc
rdococa
rdocoac

Guilherme Roberto Utech e Lucas Litter Mentz.

 T1: 0.015625    T2: 0.828125  msec
 Tempo total: 0.8125000000  msec
true.

*/

main :- 
    %% Tempo inicial
    statistics(cputime,T1),
 
	palavra3,
	palavra4,
	palavra5,
	palavra6,
	palavra7,
	nl,
	write('Guilherme Roberto Utech e Lucas Litter Mentz.'),
	nl,
 
    %% Tempo final
    statistics(cputime, T2), 
    Tempo_BUSCA is (T2 - T1), 
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA).


letra(1,c).
letra(2,a).
letra(3,o).
letra(4,c).
letra(5,o).
letra(6,d).
letra(7,r).

palavra3 :- 
	letra(N1,L1),
	letra(N2,L2),
	letra(N3,L3),
	letrasdiferentes( [N1,N2,N3] ),
	format('~w~w~w\n', [L1,L2,L3] ),
	fail.
palavra3.

palavra4 :- 
	letra(N1,L1),
	letra(N2,L2),
	letra(N3,L3),
	letra(N4,L4),
	letrasdiferentes( [N1,N2,N3,N4] ),
	format('~w~w~w~w\n', [L1,L2,L3,L4] ),
	fail.
palavra4.

palavra5 :- 
	letra(N1,L1),
	letra(N2,L2),
	letra(N3,L3),
	letra(N4,L4),
	letra(N5,L5),
	letrasdiferentes( [N1,N2,N3,N4,N5] ),
	format('~w~w~w~w~w\n', [L1,L2,L3,L4,L5] ),
	fail.
palavra5.

palavra6 :- 
	letra(N1,L1),
	letra(N2,L2),
	letra(N3,L3),
	letra(N4,L4),
	letra(N5,L5),
	letra(N6,L6),
	letrasdiferentes( [N1,N2,N3,N4,N5,N6] ),
	format('~w~w~w~w~w~w\n', [L1,L2,L3,L4,L5,L6] ),
	fail.
palavra6.

palavra7 :- 
	letra(N1,L1),
	letra(N2,L2),
	letra(N3,L3),
	letra(N4,L4),
	letra(N5,L5),
	letra(N6,L6),
	letra(N7,L7),
	letrasdiferentes( [N1,N2,N3,N4,N5,N6,N7] ),
	format('~w~w~w~w~w~w~w\n', [L1,L2,L3,L4,L5,L6,L7] ),
	fail.
palavra7.

letrasdiferentes( [ ] ).
letrasdiferentes( [H|T] ) :- 
	not(member(H,T)),
	letrasdiferentes(T).


