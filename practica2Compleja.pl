lanzador(AL,PL,AC,PC,E,Path,A,B,C,D):- verificar_personas(AL,PL,AC,PC,E,Path,A,B,C,D),ascensor(E),write("Procesando informacion.\n"),algoritmo(AL,PL,AC,PC,E,Path,A,B,C,D).
verificar_personas(AL,PL,AC,PC,_,_,A,B,C,D):- Ai is AL + AC, Pi is PC + PL ,  AS is A + C, PS is B + D, PS = Pi, AS = Ai,!.
verificar_personas(_,_,_,_,_,_,_,_,_,_):-  write("Los alumnos y profesores están descompensados. ").
ascensor(arriba):- !.
ascensor(abajo):- !.
ascensor(_):- write("El ascensor tiene que valer abajo o arriba. "),fail.

algoritmo(AL,PL,AC,PC,arriba,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,arriba],Path),AC>=2,ACs is AC-2,compare(ACs,PC),PC=<ACs, ALs is AL+2,algoritmo(ALs,PL,ACs,PC,abajo,[[AL,PL,AC,PC,arriba]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,arriba,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,arriba],Path),PC>=2,PCs is PC-2,compare(AC,PCs), PLs is PL+2,compare(AL,PLs),algoritmo(AL,PLs,AC,PCs,abajo,[[AL,PL,AC,PC,arriba]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,arriba,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,arriba],Path),AC=0,PC>=2,PCs is PC-2, PLs is PL+2,compare(AL,PLs),algoritmo(AL,PLs,AC,PCs,abajo,[[AL,PL,AC,PC,arriba]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,arriba,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,arriba],Path),AC=0,PC>=1,PCs is PC-1,PLs is PL+1, compare(AL,PLs),algoritmo(AL,PLs,AC,PCs,abajo,[[AL,PL,AC,PC,arriba]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,arriba,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,arriba],Path),AC>=1,PC>=1,ACs is AC-1,PCs is PC-1,ALs is AL+1,PLs is PL+1,algoritmo(ALs,PLs,ACs,PCs,abajo,[[AL,PL,AC,PC,arriba]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,arriba,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,arriba],Path),AC>=1,ACs is AC-1,compare(ACs,PC),ALs is AL+1,algoritmo(ALs,PL,ACs,PC,abajo,[[AL,PL,AC,PC,arriba]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,arriba,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,arriba],Path),PC>=1,PCs is PC-1,compare(AC,PCs),PLs is PL+1,compare(AL,PLs),algoritmo(AL,PLs,AC,PCs,abajo,[[AL,PL,AC,PC,arriba]|Path],A,B,C,D).

algoritmo(A,B,C,D,abajo,P,A,B,C,D):- write("Camino : "),write(P).

algoritmo(AL,PL,AC,PC,abajo,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,abajo],Path),AL>=1,ALs is AL-1,compare(ALs,PL),ACs is AC+1,algoritmo(ALs,PL,ACs,PC,arriba,[[AL,PL,AC,PC,abajo]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,abajo,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,abajo],Path),PL>=1,PLs is PL-1,compare(AL,PLs),PCs is PC+1,compare(AC,PCs),algoritmo(AL,PLs,AC,PCs,arriba,[[AL,PL,AC,PC,abajo]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,abajo,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,abajo],Path),AL>=2,ALs is AL-2,compare(ALs,PC), ACs is AC+2,algoritmo(ALs,PL,ACs,PC,arriba,[[AL,PL,AC,PC,abajo]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,abajo,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,abajo],Path),PL>=2,PLs is PL-2,compare(AL,PLs), PCs is PC+2,compare(AC,PCs),algoritmo(AL,PLs,AC,PCs,arriba,[[AL,PL,AC,PC,abajo]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,abajo,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,abajo],Path),AL=0,PL>=2,PLs is PL-2, PCs is PC+2,compare(AC,PCs),algoritmo(AL,PLs,AC,PCs,arriba,[[AL,PL,AC,PC,abajo]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,abajo,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,abajo],Path),AL=0,PL>=1,PLs is PL-1,PCs is PC+1, compare(AC,PCs),algoritmo(AL,PLs,AC,PCs,arriba,[[AL,PL,AC,PC,abajo]|Path],A,B,C,D).
algoritmo(AL,PL,AC,PC,abajo,Path,A,B,C,D):- no_es_miembro([AL,PL,AC,PC,abajo],Path),AL>=1,PL>=1,ALs is AL-1,PLs is PL-1,ACs is AC+1,PCs is PC+1,algoritmo(ALs,PLs,ACs,PCs,arriba,[[AL,PL,AC,PC,abajo]|Path],A,B,C,D).

compare(A,B):- B=<A.
compare(0,_).

no_es_miembro(Arg,[Arg|_]) :-!,fail.
no_es_miembro(Arg,[_|Tail]) :-!,no_es_miembro(Arg,Tail).
no_es_miembro(_,[]).

