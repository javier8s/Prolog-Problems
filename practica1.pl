ejercicio1(_,_,F,Z,Z):- F=0.
ejercicio1([X|Y],I,F,[X|S],Z):- I=0,Fs is F-1,ejercicio1(Y,I,Fs,S,Z).
ejercicio1(Y,I,F,S):- Is is I-1, Fs is F-1 , ejercicio1(Y,Is,Fs+1,S,[]),!.




